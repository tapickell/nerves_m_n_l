
cp -R ../nerves_examples/hello_phoenix ./phx_example/
cd phx_example/
asdf local nodejs 12.20.0
asdf local erlang 24.0.2
asdf local elixir 1.12.1-otp-24
mix archive.install hex nerves_bootstrap
cd ui && mix setup && mix preburn && cd ../
cd firmware
MIX_TARGET=rpi0 mix deps.get
MIX_TARGET=rpi0 NERVES_NETWORK_SSID=ssid NERVES_NETWORK_PSK=password mix firmware.burn  -d /dev/dev_name
# mix firmware.gen.script
cp ../upload.sh upload.sh
MIX_TARGET=rpi0 NERVES_NETWORK_SSID=ssid NERVES_NETWORK_PSK=password mix firmware
./upload.sh nerves.local _build/rpi0_dev/nerves/images/firmware.fw

