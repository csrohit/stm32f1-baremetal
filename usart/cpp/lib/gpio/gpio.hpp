#pragma once

/**
 * @file gpio.hpp
 * @author Rohit Nimkar (nehalnimkar@gmail.com)
 * @brief Declaration of functionality related to GPIO
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


#include <stm32f1xx.h>
#include <stdint.h>

#pragma once
class GPIO
{
public:
    enum PIN : uint8_t;
    enum PIN_STATE : uint8_t;
    enum MODE : uint8_t;
    enum CNF : uint8_t;

private:
    PIN pin;
    GPIO_TypeDef *PORT;

public:
    /**
     * @brief GPIO port pins
     *
     */
    enum PIN : uint8_t
    {
        PIN_0 = (uint8_t)0x0000,  /* GPIO pin 0 */
        PIN_1 = (uint8_t)0x0001,  /* GPIO pin 1 */
        PIN_2 = (uint8_t)0x0002,  /* GPIO pin 2 */
        PIN_3 = (uint8_t)0x0003,  /* GPIO pin 3 */
        PIN_4 = (uint8_t)0x0004,  /* GPIO pin 4 */
        PIN_5 = (uint8_t)0x0005,  /* GPIO pin 5 */
        PIN_6 = (uint8_t)0x0006,  /* GPIO pin 6 */
        PIN_7 = (uint8_t)0x0007,  /* GPIO pin 7 */
        PIN_8 = (uint8_t)0x0008,  /* GPIO pin 8 */
        PIN_9 = (uint8_t)0x0009,  /* GPIO pin 9 */
        PIN_10 = (uint8_t)0x000A, /* GPIO pin 10 */
        PIN_11 = (uint8_t)0x000B, /* GPIO pin 11 */
        PIN_12 = (uint8_t)0x000C, /* GPIO pin 12 */
        PIN_13 = (uint8_t)0x000D, /* GPIO pin 13 */
        PIN_14 = (uint8_t)0x000E, /* GPIO pin 14 */
        PIN_15 = (uint8_t)0x000F, /* GPIO pin 15 */
        PIN_ALL = (uint8_t)0xffff /* Select all gpio pins */
    };

    /**
     * @brief GPIO logical pin state
     *
     */
    enum PIN_STATE : uint8_t
    {
        LOW = (uint8_t)0x00, /* Pin state logical LOW */
        HIGH = (uint8_t)0x01 /* Pin state logical HIGH */
    };

    enum MODE : uint8_t
    {
        INPUT = (uint8_t)0b00,
        OUTPUT_10MHZ,
        OUTPUT_2MHZ,
        OUTPUT_50MHZ
    };

    enum CNF : uint8_t
    {
        INPUT_ANALOG = (uint8_t)0b00,
        INPUT_FLOATING,
        INPUT_PULLUP_DOWN,
        INPUT_RESERVED,
        OUTPUT_PUSH_PULL = (uint8_t)0b00,
        OUTPUT_OPEN_DRAIN,
        OUTPUT_ALT_PUSH_PULL,
        OUTPUT_ALT_OPEN_DRAIN
    };

    GPIO() : pin{PIN_0}, PORT{nullptr}
    {
    }

    GPIO(GPIO_TypeDef *port) : pin{PIN_0}, PORT{port}
    {
    }

    GPIO(const GPIO &gpio) : pin{gpio.pin}, PORT{gpio.PORT}
    {
    }

    GPIO &operator=(const GPIO &gpio);

    /**
     * @brief Construct a new GPIO object
     *
     * @param port POinter to port base address
     * @param newPin pin number
     */
    GPIO(GPIO_TypeDef *port, PIN newPin) : pin{newPin}, PORT{port} {}

    /**
     * @brief Enable Clock source for GPIO port
     * @param port GPIO port instance
     */
    constexpr static void enable_port(GPIO_TypeDef *port);

    /**
     * @brief Destroy the GPIO object
     */
    ~GPIO();

    /**
     * @brief Write HIGH logic to GPIO
     */
    void high();
    static void high(GPIO_TypeDef *port, PIN newPin);

    /**
     * @brief Write LOW logic to GPIO
     */
    void low();
    static void low(GPIO_TypeDef *port, PIN newPin);

    /**
     * @brief Toggle GPIO
     */
    void toggle();
    static void toggle(GPIO_TypeDef *port, PIN newPin);

    /**
     * @brief Set the state of GPIO pin
     * @param state new state to be set
     */
    void write(PIN_STATE state);
    static void write(GPIO_TypeDef *port, PIN newPin, PIN_STATE state);

    void setMode(MODE mode);
    static void setMode(GPIO_TypeDef *port, PIN newPin, MODE mode);

    void setConfig(CNF cnf);
    static void setConfig(GPIO_TypeDef *port, PIN newPin, CNF cnf);
};

inline GPIO &GPIO::operator=(const GPIO &gpio)
{
    this->pin = gpio.pin;
    this->PORT = gpio.PORT;
    return *this;
}

constexpr inline void GPIO::enable_port(GPIO_TypeDef *port)
{
    if (port == GPIOA)
    {
        RCC->APB2ENR |= RCC_APB2ENR_IOPAEN;
    }
    else if (port == GPIOB)
    {
        RCC->APB2ENR |= RCC_APB2ENR_IOPBEN;
    }
    else if (port == GPIOC)
    {
        RCC->APB2ENR |= RCC_APB2ENR_IOPCEN;
    }
}

inline void GPIO::setMode(MODE mode)
{
    setMode(PORT, pin, mode);
};
inline void GPIO::setMode(GPIO_TypeDef *port, PIN newPin, MODE mode)
{
    if (newPin < PIN_8)
    {
        port->CRL &= ~(0b11 << (newPin << 2));
        port->CRL |= mode << (newPin << 2);
    }
    else
    {
        port->CRH &= ~(0b11 << ((newPin - 8) << 2));
        port->CRH |= mode << ((newPin - 8) << 2);
    }
}
inline void GPIO::setConfig(CNF config)
{
    setConfig(PORT, pin, config);
}
inline void GPIO::setConfig(GPIO_TypeDef *port, PIN newPin, CNF config)
{
    if (newPin < PIN_8)
    {
        port->CRL &= ~(0b11 << ((newPin << 2) + 2));
        port->CRL |= config << ((newPin << 2) + 2);
    }
    else
    {
        port->CRH &= ~(0b11 << (((newPin - 8) << 2) + 2));
        port->CRH |= config << (((newPin - 8) << 2) + 2);
    }
}

inline void GPIO::toggle() { this->PORT->ODR ^= 1 << this->pin; }
inline void GPIO::toggle(GPIO_TypeDef *port, PIN newPin) { port->ODR ^= 1 << newPin; }

inline void GPIO::write(PIN_STATE state)
{
    if (state == HIGH)
    {
        high();
    }
    else
    {
        low();
    }
};
inline void GPIO::write(GPIO_TypeDef *port, PIN newPin, PIN_STATE state)
{
    if (state == HIGH)
    {
        high(port, newPin);
    }
    else
    {
        low(port, newPin);
    }
};

inline void GPIO::high() { this->PORT->BSRR = 1 << this->pin; };
inline void GPIO::high(GPIO_TypeDef *port, PIN newPin) { port->BSRR = 1 << newPin; };

inline void GPIO::low() { this->PORT->BRR = 1 << this->pin; };
inline void GPIO::low(GPIO_TypeDef *port, PIN newPin) { port->BRR = 1 << newPin; };
