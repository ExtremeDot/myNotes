```
curl -O https://raw.githubusercontent.com/ExtremeDot/GoldenOne_MENU/main/extraMenu.sh && chmod +x extraMenu.sh

mv extraMenu.sh /bin/eMenu && chmod +x /bin/eMenu

eMenu
```

* Update Kernel to XanMod

```onfo
Current Installed Kernel= Linux version 6.1.29-x64v3-xanmod1

BBR Status= bbr - tcp_bbr                20480  7
```


* Change SSH Port

* Install Certificate

* Install FranzKafkaYu Panel
```bash
bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install_en.sh)
```

* Update DAT files


```bash

cd /usr/local/x-ui/bin
systemctl stop x-ui
wget -N https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
wget -N https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
wget -N https://github.com/bootmortis/iran-hosted-domains/releases/latest/download/iran.dat
systemctl start x-ui
```

* Install WARP on 40000

* Update Config


```config
{
  "log": {
    "loglevel": "warning",
    "access": "./access.log",
    "error": "./error.log"
  },
  "api": {
    "tag": "api",
    "services": [
      "HandlerService",
      "LoggerService",
      "StatsService"
    ]
  },
  "inbounds": [
    {
      "tag": "api",
      "listen": "127.0.0.1",
      "port": 62789,
      "protocol": "dokodemo-door",
      "settings": {
        "address": "127.0.0.1"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "tag": "blocked",
      "protocol": "blackhole",
      "settings": {}
    },
    {
      "tag": "direct",
      "protocol": "freedom"
    },
    {
      "tag": "WARP",
      "protocol": "socks",
      "settings": {
        "servers": [
          {
            "address": "127.0.0.1",
            "port": 40000
          }
        ]
      }
    }
  ],
  "policy": {
    "levels": {
      "0": {
        "statsUserDownlink": true,
        "statsUserUplink": true
      }
    },
    "system": {
      "statsInboundDownlink": true,
      "statsInboundUplink": true
    }
  },
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": [
      {
        "type": "field",
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api"
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "ip": [
          "geoip:private"
        ]
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ]
      },
      {
        "type": "field",
        "outboundTag": "blocked",
        "domain": [
          "geosite:category-ads-all",
          "geosite:category-ads",
          "geosite:google-ads",
          "geosite:spotify-ads",
          "ext:iran.dat:ads"
        ]
      },
      {
        "type": "field",
        "outboundTag": "direct",
        "ip": [
          "geoip:ir"
        ]
      },
      {
        "type": "field",
        "outboundTag": "direct",
        "domain": [
          "regexp:.*\\.ir$",
          "ext:iran.dat:ir",
          "ext:iran.dat:other",
          "geosite:category-ir"
        ]
      },
      {
        "type": "field",
        "outboundTag": "WARP",
        "domain": [
          "geosite:google",
          "geosite:openai",
          "geosite:netflix",
          "geosite:instagram",
          "geosite:bbc",
          "geosite:hulu",
          "geosite:spotify",
          "domain:myip.wtf"
        ]
      }
    ]
  },
  "stats": {}
}
```

