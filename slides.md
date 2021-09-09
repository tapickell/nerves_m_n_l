% Solving Problems using Nerves
% Todd Pickell
% 2021-09-08

---
header-includes: |
  <style>
  :root {
    --r-main-font: OpenDyslexic;
    --r-main-font-size: 36px;
    --r-heading-font: OpenDyslexic;
    --r-heading1-size: 2.25em;
  }
  </style>
---

Questions to Answer:

- What is Nerves?
- Who is Nerves for?
- Where can one run Nerves?
- Why would one use Nerves?
- How does one get started with Nerves?
- When does one achieve Nervana?

---

What is Nerves?

- [The Nerves Project](https://github.com/nerves-project/)
- Nerves is a set of libraries for developing and deploying embedded software
written in Elixir, Erlang and/or [Lisp flavored Erlang](https://github.com/nerves-project/nerves_examples/tree/main/hello_lfe).

---

Who is Nerves for?

- Hobbyists & Tinkerers
- Commercial Applications
- Industrial Systems
- Anywhere [Soft Real-Time](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwiS35mqo-vyAhXJK80KHX0uCEoQFnoECBMQAw&url=https%3A%2F%2Fusers.ece.cmu.edu%2F~koopman%2Fdes_s99%2Freal_time%2F&usg=AOvVaw1QNi8zB8beppUoK32nDfJN) systems are a good fit

---

Where can one run Nerves?

- For hobbyists Raspberry Pi and BeagleBone are good boards to start with.
- Nerves leverages [Buildroot](https://buildroot.org/) for the embedded Linux 
system that the Erlang VM runs on.
- If it can run embedded Linux it can most likely run Nerves. 
[Nerves Switch](https://twitter.com/pressy4pie/status/1362567968694042626)

---

Why would one use Nerves?

- Talking to components over GPIO, I2C, SPI, UART
- Gathering data from sensors
- Receiving input from switches, buttons and rotary encoders
- Coordinating other microcontrollers
- Developing Kiosk applications
- Anything you want to use Embedded Linux for 

---

Example Use Cases:

- [HOP](https://www.nerves-project.org/customer-hop.html) A touchscreen kiosk 
that not only interacts with hardware to dispense but is also a POS system.
- [Farmbot](https://www.nerves-project.org/customer-farmbot.html) CNC Farming 
using Raspberry Pi to coordinate and drive arduino boards that control the 
servos and motors of the system.
- [Drizzle](https://github.com/supersimple/drizzle) Smart lawn watering system 
that takes into account the weather forcast 
- [Rpi Drum Machine](https://github.com/hassanshaikley/rpi-drum-machine-nerves) 
which you will learn more about from Hassan during the next Munch N Learn

---

How does one get started with Nerves?

- 💻 [Install deps and Hex pkg](https://hexdocs.pm/nerves/installation.html)
- 🌂 [Create Nerves Poncho App](https://github.com/nerves-project/nerves_examples/tree/main/hello_phoenix)
- 🔥 Burn to SD Card
- 📡 [FWUP over SSH](https://github.com/nerves-project/nerves_ssh)
- 💵 [Profit](http://nerves.local/)

---

Add preburn to `ui/mix.exs` aliases

```
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"],
      preburn: [
        "cmd npm install --prefix assets --production",
        "cmd npm run deploy --prefix assets",
        "phx.digest"
      ]
    ]
  end
```

---

When does one achieve Nervana?

This used to work :shrug: 
```
mix firmware.gen.script 
/upload.sh nerves.local _build/rpi0_dev/nerves/images/firmware.fw
```

This still works :meow_party:

```
cat _build/rpi0_dev/nerves/images/firmware.fw | ssh -s nerves.local fwup
```

---

![](profit.jpg)
