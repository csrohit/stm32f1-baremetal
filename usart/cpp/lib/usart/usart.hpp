/**
 * @file usart.hpp
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Declaration of functionality related to USART
 * @version 1.2
 * @date 2022-12-07
 *
 * @copyright Copyright (c) 2022
 * @attention
 *
 * This software component is licensed by Rohit Nimkar under BSD 3-Clause license,
 * the "License"; You may not use this file except in compliance with the
 * License. You may obtain a copy of the License at: opensource.org/licenses/BSD-3-Clause
 *
 */

#include <stdlib.h>
#include <stm32f1xx.h>
#include <system.hpp>
#pragma once

class USART
{
public:
    enum UsartInstance : uint32_t
    {
        Usart1 = USART1_BASE,
        Usart2 = USART2_BASE,
        Usart3 = USART3_BASE
    };

    enum Parity : uint8_t
    {
        ParityEven = 0x00,
        ParityOdd = 0x01
    };

    typedef enum
    {
        Disabled,
        Enabled
    } ParityControlState,
        UsartState, InterruptState, TransmitterState, ReceiverState,
        LinModeState, CLKPinState, LastBitClockPulseState,
        CtsState, RtsState, DmaRequestState, SmartCardModeState,
        SmartCardNackState, HalfDuplexState, IrdaModeState;

    typedef enum
    {
        Start1_Data8_StopN = 0x00,
        Start1_Data9_StopN = 0x01
    } WordLength;

    typedef enum
    {
        ParityErrorInterrupt = USART_CR1_PEIE,
        TransmitDataRegisterEmptyInterrupt = USART_CR1_TXEIE,
        TransmissionCompleteInterrupt = USART_CR1_TCIE,
        ReceivedDataReadyToReadInterrupt = USART_CR1_RXNEIE,
        IdleInterrupt = USART_CR1_IDLEIE
    } CR1Interrupt;

    typedef enum BaudRate : uint32_t
    {
        BR_9600 = 9600,
        BR_115200 = 115200
    } baud_rate_t;

    typedef enum
    {
        IdleLine = 0x00,
        AddressMark = 0x01
    } WakeupMethod;

    /* CR2 */

    /* Program number of stop bits */
    typedef enum
    {
        /* 1 stop bit */
        StopBits1,
        /* 0.5 stop bit */
        StopBits0_5,
        /* 2 stop bits */
        StopBits2,
        /* 1.5 stop bits */
        StopBits1_5
    } StopBits;

    /* Polarity of clock output on CK pin in synchronous mode */
    typedef enum
    {
        /* A stready LOW value on the CK pin outside transmission window */
        CPOL_LOW,
        /* A stready HIGH value on the CK pin outside transmission window */
        CPOL_HIGH
    } ClockPolarity;

    /* Phase of the clock output on the CK pin in synchronous mode */
    typedef enum
    {
        /**
         * @brief First clock transition is the first data capture edge
         */
        CPHA_FirstTransition,

        /**
         * @brief The second clock transition is the first data capture edge
         */
        CPHA_SecondTransition
    } ClockPhase;
    typedef enum
    {
        /* 10 bit break detection */
        BreakDetection10Bit,
        /* 11 bit break detection */
        BreakDetection11Bit
    } LinBreakDetectionLength;

    typedef enum
    {
        LinBreakDetectionInterrupt = USART_CR2_LBDIE
    } CR2Interrupt;

    /* CR3 */

    typedef enum
    {
        /* An interrupt is generated whenever CTS=1 in USART_SR register */
        CtsInterrupt = USART_CR3_CTSIE,
        /**
         * Error Interrupt Enable Bit is required to enable interrupt generation in case of a framing error,
         *  overrun error or noise error (FE=1 or ORE=1 or NE=1 in the USART_SR register) in case of
         * Multi Buffer Communication (DMAR=1 in the USART_CR3 register).
         */
        ErrorInterrupt = USART_CR3_EIE
    } Cr3Interrupt;
    typedef enum
    {
        TransmitterRequest = USART_CR3_DMAT,
        ReceiverRequest = USART_CR3_DMAR
    } DmaRequest;

    typedef enum
    {
        /* Normal power level */
        Normal,
        /* Low power level */
        Low
    } IrdaPowerLevel;

private:
    volatile uint32_t SR;   /*!< USART Status register,                   Address offset: 0x00 */
    volatile uint32_t DR;   /*!< USART Data register,                     Address offset: 0x04 */
    volatile uint32_t BRR;  /*!< USART Baud rate register,                Address offset: 0x08 */
    volatile uint32_t CR1;  /*!< USART Control register 1,                Address offset: 0x0C */
    volatile uint32_t CR2;  /*!< USART Control register 2,                Address offset: 0x10 */
    volatile uint32_t CR3;  /*!< USART Control register 3,                Address offset: 0x14 */
    volatile uint32_t GTPR; /*!< USART Guard time and prescaler register, Address offset: 0x18 */
public:
    USART()
    {
        if (this == reinterpret_cast<USART *>(Usart1))
        {
            // enable clock for GPIOA and USART1
            RCC->APB2ENR |= RCC_APB2ENR_USART1EN | RCC_APB2ENR_IOPAEN;

            // reset pin configurations for PA9 and PA10
            GPIOA->CRH &= ~(GPIO_CRH_MODE10 | GPIO_CRH_MODE9 | GPIO_CRH_CNF10 | GPIO_CRH_CNF9);

            // PA9 as Output@50Hz Alternate function
            GPIOA->CRH |= GPIO_CRH_MODE9_0 | GPIO_CRH_MODE9_1 | GPIO_CRH_CNF9_1;

            // PA10 as floating input
            GPIOA->CRH |= GPIO_CRH_CNF10_0;
        }
    }

    ~USART()
    {
        if (this == reinterpret_cast<USART *>(Usart1))
        {
            // disable clock for USART1 peripheral
            RCC->APB2ENR &= ~RCC_APB2ENR_USART1EN;
        }
    }

    /**
     * @brief Get reference to a USART instance
     *
     * @param usart required hardware usart instance
     * @return void* pointer to the USART object
     */
    void *operator new(size_t, UsartInstance usart)
    {
        return reinterpret_cast<void *>(usart);
    }

    /**
     * @brief Enable or disable USART peripheral
     * When USART is disabled, the prescalers and outputs are stopped at the end of the current
     * byte transfer in order to reduce power consumption. This bit is set and cleared by software.
     * @param state desired state
     */
    void setUsartState(UsartState state)
    {
        if (state == Enabled)
        {
            CR1 |= USART_CR1_UE;
        }
        else
        {
            CR1 &= ~USART_CR1_UE;
        }
    }

    /**
     * @brief Set the Word Length for data transfer
     * @param m desired word length
     * @note Word length must not be modified during a data transfer (Both reception and transmission).
     */
    void setWordLength(WordLength m)
    {
        if (m == WordLength::Start1_Data9_StopN)
        {
            CR1 |= USART_CR1_M;
        }
        else
        {
            CR1 |= USART_CR1_M;
        }
    }

    /**
     * @brief Sets the USART Wakeup method
     *
     * @param method desired wakeup method
     */
    void setWakeupMethod(WakeupMethod method)
    {
        if (method == WakeupMethod::AddressMark)
        {
            CR1 |= USART_CR1_WAKE;
        }
        else
        {
            CR1 &= ~USART_CR1_WAKE;
        }
    }

    /**
     * @brief Sets the hardware parity control state. When the parity control is enabled,
     * the computed parity is inserted at the MSB position (9th bit if M=1; 8th bit if M=0) and parity is checked on the received data.
     * PCE is active after the current byte (in reception and in transmission).
     * @param state desired parity control state
     */
    void setParityControl(ParityControlState state)
    {
        if (state == Enabled)
        {
            CR1 |= USART_CR1_PCE;
        }
        else
        {
            CR1 &= ~USART_CR1_PCE;
        }
    }

    /**
     * @brief This selects the odd or even parity when the parity generation/detection is enabled (PCE bit set).
     * Parity will be selected after the current byte.
     * @param parity desired parity
     */
    void setParity(Parity parity)
    {
        if (parity == ParityEven)
        {
            CR1 &= ~USART_CR1_PS;
        }
        else
        {
            CR1 |= USART_CR1_PS;
        }
    }

    /**
     * @brief Enable/Disable interrupts for USART (CR1 register)
     *
     * @param intr interrupt
     * @param state target state of the interrupt
     */
    void setInterruptState(CR1Interrupt intr, InterruptState state)
    {
        if (state == InterruptState::Enabled)
        {
            CR1 |= intr;
        }
        else
        {
            CR1 &= ~intr;
        }
    }

    /**
     * @brief Enable/Disable transmitter circuit
     *
     * @param state desired state of transmitter
     */
    void setTransmitterState(TransmitterState state)
    {
        if (state == TransmitterState::Enabled)
        {
            CR1 |= USART_CR1_TE;
        }
    }

    /**
     * @brief Enable/Disable Receiver circuit
     *
     * @param state desired state of Receiver
     * when enabled receive will start searching for the start bit
     */
    void setReceiverState(ReceiverState state)
    {
        if (state == ReceiverState::Enabled)
        {
            CR1 |= USART_CR1_TE;
        }
    }

    /**
     * @brief Set the baudrate for communication, (115200 is the max baudrate supported without flow-control)
     * @param baudrate desired baudrate
     */
    inline void set_baudrate(baud_rate_t baudrate)
    {
        uint32_t baud = (uint32_t)(Core::clock / baudrate);
        BRR = baud;
    }

    /* CR2 register methods */
    /**
     * @brief Set the Lin Mode State
     * @param state desired state of LIN mode
     */
    void setLinModeState(LinModeState state)
    {
        if (state == LinModeState::Enabled)
        {
            CR2 |= USART_CR2_LINEN;
        }
        else
        {
            CR2 &= ~USART_CR2_LINEN;
        }
    }

    /**
     * @brief Set the Stop Bits
     * @param nStop number os stop bits
     */
    void setStopBits(StopBits nStop)
    {
        if (nStop != StopBits::StopBits1_5)
        {
            CR2 &= ~(0b11 << USART_CR2_STOP_Pos); // clear both bits
        }
        if (nStop != StopBits::StopBits1)
        {
            CR2 |= nStop << USART_CR2_STOP_Pos; // set bits when no zero
        }
    }

    /**
     * @brief Set the clock pin state, enable it to output clock on CK pin in synchronous mode
     * @param state desired clock pin state
     */
    void setClockPinState(CLKPinState state)
    {
        if (state == CLKPinState::Enabled)
        {
            CR2 |= USART_CR2_CLKEN;
        }
        else
        {
            CR2 &= ~USART_CR2_CLKEN;
        }
    }

    /**
     * @brief Set the phase of the clock output in the CK pin in synchronous mode
     * This works in conjunction with CPOL to produce the desired clock/data relationship
     * @param phase
     */
    void setClockPhase(ClockPhase phase)
    {
        if (phase == ClockPhase::CPHA_SecondTransition)
        {
            CR2 |= USART_CR2_CPHA;
        }
        else
        {
            CR2 &= ~USART_CR2_CPHA;
        }
    }

    /**
     * @brief Set the polarity of the clock output on the CK pin in synchronous mode.
     * It works in conjunction with the CPHA bit to produce the desired clock/data relationship
     *
     * @param polarity desired clock polarity
     */
    void setClockPolarity(ClockPolarity polarity)
    {
        if (polarity == ClockPolarity::CPOL_HIGH)
        {
            CR2 |= USART_CR2_CPOL;
        }
        else
        {
            CR2 &= ~USART_CR2_CPOL;
        }
    }

    /**
     * @brief Set weather the clock pulse associated with the last data bit transmitted (MSB) has to be output in synchronous mode.
     * The last bit is the 8th or 9th data bit transmitted depending on the 8 or 9 bit data format selected by the setWordLength() method.
     * @param state Enabled / Disabled
     */
    void setLastBitClockPulseState(LastBitClockPulseState state)
    {
        if (state == LastBitClockPulseState::Enabled)
        {
            CR2 |= USART_CR2_LBCL;
        }
        else
        {
            CR2 &= ~USART_CR2_LBCL;
        }
    }

    /**
     * @brief set the LIN break detection length
     * @param length desired break detection length
     */
    void setLINBreakDetectionLength(LinBreakDetectionLength length)
    {
        if (length == LinBreakDetectionLength::BreakDetection11Bit)
        {
            CR2 |= USART_CR2_LBDL;
        }
        else
        {
            CR2 &= ~USART_CR2_LBDL;
        }
    }

    /**
     * @brief Enable/Disable interrupts for USART (CR2 register)
     *
     * @param intr interrupt
     * @param state target state of the interrupt
     */
    void setInterruptState(CR2Interrupt intr, InterruptState state)
    {
        if (state == InterruptState::Enabled)
        {
            CR2 |= intr;
        }
        else
        {
            CR2 &= ~intr;
        }
    }

    /**
     * @brief Set the Address Of Usart Node object
     * Address is used in multiprocessor communication during mute mode, for wakeup with address mark detection
     * @param addr
     */
    void setAddressOfUsartNode(uint8_t addr)
    {
        uint32_t val = CR1;
        val &= ~0x0f;
        val |= addr;
        CR1 = val;
    }

    /* CR3 register methods */
    /**
     * @brief Set the Interrupt State for interrupts in CR3 register
     * @param intr interrupt in CR3 register
     * @param state Enabled / Disabled state of the register
     */
    void setInterruptState(Cr3Interrupt intr, InterruptState state)
    {
        if (state == InterruptState::Enabled)
        {
            CR3 |= intr;
        }
        else
        {
            CR3 &= ~intr;
        }
    }

    /**
     * @brief Set hardware flow control
     * When enabled, data is only transmitted when CTS input is asserted (tied to 0).
     * If the CTS input is deserted while the data is being transmitted, then the transmitted before stopping.
     * If a data is written into the data register while CTS is deserted, the transmission is postpone until the CTS is reasserted.
     * @param state Enabled / Disabled
     */
    void setCtsState(CtsState state)
    {
        if (state == CtsState::Enabled)
        {
            CR3 |= USART_CR3_CTSE;
        }
        else
        {
            CR3 &= ~USART_CR3_CTSE;
        }
    }

    /**
     * @brief Set the Rts State object
     * When enabled, data is only requested when there is space in the receive buffer.
     * The transmission of ddata is expected to cease after currect chracter has been transmitted.
     * The RTS signal is asserted (Tied to 0) when a data can be received.
     * @param state Enabled / Disabled
     */
    void setRtsState(RtsState state)
    {
        if (state == RtsState::Enabled)
        {
            CR3 |= USART_CR3_RTSE;
        }
        else
        {
            CR3 &= ~USART_CR3_RTSE;
        }
    }

    /**
     * @brief Set the Dma Request State for USART
     * When enabled the transmitter will request DMA for the data to be transmitted
     * The receiveer will request the DMA to read the received data
     * @param dma_request Transmitter or receiver request
     * @param state Enabled/Disabled
     */
    void setDmaRequestState(DmaRequest dma_request, DmaRequestState state)
    {
        if (state == DmaRequestState::Enabled)
        {
            CR3 |= dma_request;
        }
        else
        {
            CR3 &= ~dma_request;
        }
    }

    /**
     * @brief Set the Smart Card Mode State
     *
     * @param state Enabled / Disabled
     */
    void setSmartCardModeState(SmartCardModeState state)
    {
        if (state == Enabled)
        {
            CR3 |= USART_CR3_SCEN;
        }
        else
        {
            CR3 &= ~USART_CR3_SCEN;
        }
    }

    /**
     * @brief Set the Smart Card NACK State
     *
     * @param state Enabled / Disabled
     */
    void setSmartCardNackState(SmartCardNackState state)
    {
        if (state == Enabled)
        {
            CR3 |= USART_CR3_NACK;
        }
        else
        {
            CR3 &= ~USART_CR3_NACK;
        }
    }

    /**
     * @brief Set the Half duplex State
     *
     * @param state Enabled / Disabled
     */
    void setHaldDuplexState(HalfDuplexState state)
    {
        if (state == Enabled)
        {
            CR3 |= USART_CR3_HDSEL;
        }
        else
        {
            CR3 &= ~USART_CR3_HDSEL;
        }
    }

    /**
     * @brief Set the IrDA Mode State
     *
     * @param state Enabled / Disabled
     */
    void setIrdaModeState(IrdaModeState state)
    {
        if (state == Enabled)
        {
            CR3 |= USART_CR3_IREN;
        }
        else
        {
            CR3 &= ~USART_CR3_IREN;
        }
    }

    /**
     * @brief Set the Irda Power Level
     *
     * @param level Normal power level or low power level
     */
    void setIrdaPowerLevel(IrdaPowerLevel level)
    {
        if (level == IrdaPowerLevel::Low)
        {
            CR3 |= USART_CR3_IRLP;
        }
        else
        {
            CR3 &= ~USART_CR3_IRLP;
        }
    }

    /**
     * @brief Transmit character
     * If data register is not empty then character will be transmitted after current transaction
     * @param ch character to be transmitted
     */
    inline void tx_char(uint8_t ch)
    {
        while (!(SR & USART_SR_TXE))
            ;
        DR = ch;
    }

    /**
     * @brief Transmit string
     *
     * @param str pointer to NULL terminated string
     */
    inline void tx_str(const char *str)
    {
        while (*str)
        {
            tx_char(*str);
            str++;
        }
    }

    /**
     * @brief Receive a character
     * The function will wait for the receiver to receive a charater and then return the received data
     * @return uint8_t
     */
    inline uint8_t rx_char()
    {
        while (!(SR & USART_SR_RXNE))
            ;
        return DR;
    }
};
