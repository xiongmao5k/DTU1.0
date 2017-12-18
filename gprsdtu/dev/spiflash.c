#include "stdint.h"
#include "stm32f10x.h"
#include "string.h"


#define spiflashSPI_CE      GPIO_Pin_8
#define spiflashSPI_MISO    GPIO_Pin_14
#define spiflashSPI_MOSI    GPIO_Pin_15
#define spiflashSPI_SCK     GPIO_Pin_13
#define spiflashSPI_HOLD    GPIO_Pin_12
#define spiflashSPI         SPI2


#define Low     0
#define High    1


static void SPI_FLASH_ChipSelect(uint8_t state) {
    if (state == Low) {
        GPIO_ResetBits(GPIOA, spiflashSPI_CE);
    }
    else {
        GPIO_SetBits(GPIOA, spiflashSPI_CE);
    }
}

static uint8_t SPI_FLASH_SwapByte(uint8_t byte) {
    while (SPI_I2S_GetFlagStatus(spiflashSPI, SPI_I2S_FLAG_TXE) == RESET);
    SPI_I2S_SendData(spiflashSPI, byte);
    while (SPI_I2S_GetFlagStatus(spiflashSPI, SPI_I2S_FLAG_RXNE) == RESET);
    return SPI_I2S_ReceiveData(spiflashSPI);
}


/* spi flash private */
typedef struct xSTATUS_REGISTER {
    uint8_t BUSY:1;
    uint8_t WEL:1;
    uint8_t BP0:1;
    uint8_t BP1:1;
    uint8_t RES:2;
    uint8_t AAI:1;
    uint8_t BPL:1;
} StatusRegister_t;

#define spiflashOPT_CMD_RD      0x03
#define spiflashOPT_CMD_SE      0x20
#define spiflashOPT_CMD_BE      0x52
#define spiflashOPT_CMD_CE      0x60
#define spiflashOPT_CMD_BP      0x02
#define spiflashOPT_CMD_AAI     0xAF
#define spiflashOPT_CMD_RDSR    0x05
#define spiflashOPT_CMD_EWSR    0x50
#define spiflashOPT_CMD_WRSR    0x01
#define spiflashOPT_CMD_WREN    0x06
#define spiflashOPT_CMD_WRDI    0x04
#define spiflashOPT_CMD_RID     0x90

#define spiflashPROTECT_LEVEL0  0
#define spiflashPROTECT_LEVEL1  1
#define spiflashPROTECT_LEVEL2  2
#define spiflashPROTECT_LEVEL3  3


#define spiflashPAGE_SIZE       256
#define spiflashSECTOR_SIZE     (4 * 1024)
#define spiflashBLOCK_SIZE      (32 * 1024)
#define spiflashFLASH_SIZE      (256 * 1024)
#define spiflashTOTAL_BLOCK     (spiflashFLASH_SIZE / spiflashBLOCK_SIZE)
#define spiflashTOTAL_SECTOR    (spiflashFLASH_SIZE / spiflashSECTOR_SIZE)


static void SPI_FLASH_SelectProtect(uint8_t protect) {
    uint8_t ucStatus = 0;
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SwapByte(spiflashOPT_CMD_RDSR);
    ucStatus = SPI_FLASH_SwapByte(0x00);
    SPI_FLASH_ChipSelect(High);
    protect &= 3;
    ucStatus = ((ucStatus & (~(3 << 2))) | (protect << 2));
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SwapByte(spiflashOPT_CMD_EWSR);
    SPI_FLASH_ChipSelect(High);
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SwapByte(spiflashOPT_CMD_WRSR);
    SPI_FLASH_SwapByte(ucStatus);
    SPI_FLASH_ChipSelect(High);
}

static void SPI_FLASH_WriteEnable(void) {
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SwapByte(spiflashOPT_CMD_WREN);
    SPI_FLASH_ChipSelect(High);
}

static void SPI_FLASH_WriteDisable(void) {
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SwapByte(spiflashOPT_CMD_WRDI);
    SPI_FLASH_ChipSelect(High);
}

static void SPI_FLASH_SendCommandAndAddress(uint8_t comm, uint32_t address) {
    uint8_t cnt = 3;
    SPI_FLASH_SwapByte(comm);
    while (cnt--) {
        SPI_FLASH_SwapByte((address >> (cnt << 3)) & 0xFF);
    }
}

static void SPI_FLASH_WaitForBusy(void) {
    uint8_t ucStatus = 0;
    StatusRegister_t *xStatus = (void *)&ucStatus;

    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SwapByte(spiflashOPT_CMD_RDSR);
    do {
        ucStatus = SPI_FLASH_SwapByte(0x00);
    } while (xStatus->BUSY == 1);
    SPI_FLASH_ChipSelect(High);
}


/* spi flash public  */
void SPI_FLASH_ChipErase(void) {
    SPI_FLASH_WriteEnable();
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SwapByte(spiflashOPT_CMD_CE);
    SPI_FLASH_ChipSelect(High);
    SPI_FLASH_WaitForBusy();
    SPI_FLASH_WriteDisable();
}

void SPI_FLASH_BlockErase(uint32_t address) {
    SPI_FLASH_WriteEnable();
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SendCommandAndAddress(spiflashOPT_CMD_BE, address);
    SPI_FLASH_ChipSelect(High);
    SPI_FLASH_WaitForBusy();
    SPI_FLASH_WriteDisable();
}

void SPI_FLASH_SectorErase(uint32_t address) {
    SPI_FLASH_WriteEnable();
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SendCommandAndAddress(spiflashOPT_CMD_SE, address);
    SPI_FLASH_ChipSelect(High);
    SPI_FLASH_WaitForBusy();
    SPI_FLASH_WriteDisable();
}

void SPI_FLASH_Write(uint32_t address, void *buffer, size_t size) {
    uint8_t *next = buffer;
    SPI_FLASH_WriteEnable();
    SPI_FLASH_WaitForBusy();
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SendCommandAndAddress(spiflashOPT_CMD_AAI, address);
    if (size == 1) {
        SPI_FLASH_SwapByte(*next++);
        SPI_FLASH_ChipSelect(High);
        SPI_FLASH_WaitForBusy();
    } else {
        while (size--) {
            SPI_FLASH_SwapByte(*next++);
            SPI_FLASH_ChipSelect(High);
            SPI_FLASH_WaitForBusy();
            if (size) {
                SPI_FLASH_ChipSelect(Low);
                SPI_FLASH_SwapByte(spiflashOPT_CMD_AAI);
            }
        }
    }
    SPI_FLASH_WriteDisable();
}

void SPI_FLASH_Read(uint32_t address, void *buffer, size_t size) {
    uint8_t *next = buffer;
    SPI_FLASH_ChipSelect(Low);
    SPI_FLASH_SendCommandAndAddress(spiflashOPT_CMD_RD, address);
    while (size--) {
        *next++ = SPI_FLASH_SwapByte(0x00);
    }
    SPI_FLASH_ChipSelect(High);
}

void SPI_FLASH_Init(void) {
    GPIO_InitTypeDef  xGPIOCFG;
    SPI_InitTypeDef xSPICFG;
    /* spi flash gpio init */
    xGPIOCFG.GPIO_Mode = GPIO_Mode_AF_PP;
    xGPIOCFG.GPIO_Speed = GPIO_Speed_50MHz;
    xGPIOCFG.GPIO_Pin = spiflashSPI_SCK | spiflashSPI_MOSI | spiflashSPI_MISO;
    GPIO_Init(GPIOB, &xGPIOCFG);
    /* spi CE init */
    xGPIOCFG.GPIO_Mode = GPIO_Mode_Out_PP;
    xGPIOCFG.GPIO_Speed = GPIO_Speed_50MHz;
    xGPIOCFG.GPIO_Pin = spiflashSPI_CE;
    GPIO_Init(GPIOA, &xGPIOCFG);
    /* spi CE init */
    xGPIOCFG.GPIO_Mode = GPIO_Mode_Out_PP;
    xGPIOCFG.GPIO_Speed = GPIO_Speed_50MHz;
    xGPIOCFG.GPIO_Pin = spiflashSPI_HOLD;
    GPIO_Init(GPIOB, &xGPIOCFG);
    GPIO_SetBits(GPIOB, spiflashSPI_HOLD);
    GPIO_SetBits(GPIOA, spiflashSPI_CE);
    /* SPI init */
    SPI_StructInit(&xSPICFG);
    xSPICFG.SPI_Mode = SPI_Mode_Master;
    xSPICFG.SPI_NSS = SPI_NSS_Soft;
    xSPICFG.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_8;
    xSPICFG.SPI_CPOL = SPI_CPOL_High;
    xSPICFG.SPI_CPHA = SPI_CPHA_2Edge;
    SPI_Init(spiflashSPI, &xSPICFG);
    SPI_Cmd(spiflashSPI, ENABLE);
    SPI_FLASH_SelectProtect(spiflashPROTECT_LEVEL0);
}

#if 0
static uint8_t ucSectorBuffer[5000];
void SPI_FLASH_Test(void) {

    SPI_FLASH_Init();
    /* spi write enable */
    SPI_FLASH_WriteEnable();
    SPI_FLASH_WaitForBusy();
    /* spi write disable */
    SPI_FLASH_WriteDisable();
    SPI_FLASH_WaitForBusy();
    /* spi chip erase */
    SPI_FLASH_ChipErase();
    /* spi write */
    SPI_FLASH_Write(0x00, pcWriteMessage, strlen(pcWriteMessage));
    /* spi read */
    memset(aucReadBuffer, 0, sizeof(aucReadBuffer));
    SPI_FLASH_Read(0x00, aucReadBuffer, sizeof(aucReadBuffer));
    /* spi sector erase */
    SPI_FLASH_SectorErase(0x00);
    memset(aucReadBuffer, 0, sizeof(aucReadBuffer));
    SPI_FLASH_Read(0x00, aucReadBuffer, sizeof(aucReadBuffer));
    /* spi bluck erase */
    SPI_FLASH_Write(0x00, pcWriteMessage, strlen(pcWriteMessage));
    memset(aucReadBuffer, 0, sizeof(aucReadBuffer));
    SPI_FLASH_Read(0x00, aucReadBuffer, sizeof(aucReadBuffer));
    /* spi read sector */
    for (int lCnt = 0; lCnt < sizeof(ucSectorBuffer); lCnt += 1) {
        if (lCnt > 0xFF) {
            ucSectorBuffer[lCnt] = ~(lCnt & 0xFF);
        }
        else {
            ucSectorBuffer[lCnt] = lCnt;
        }
    }
    SPI_FLASH_SectorErase(0x00);
    SPI_FLASH_Write(0x00, ucSectorBuffer, sizeof(ucSectorBuffer));
    memset(ucSectorBuffer, 0x00, sizeof(ucSectorBuffer));
    SPI_FLASH_Read(0x00, ucSectorBuffer, sizeof(ucSectorBuffer));
    SPI_FLASH_SectorErase(0x00);
    memset(ucSectorBuffer, 0x00, sizeof(ucSectorBuffer));
    SPI_FLASH_Read(0x00, ucSectorBuffer, sizeof(ucSectorBuffer));
}
#endif
