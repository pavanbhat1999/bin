#!/bin/bash


awesome-client '
local naughty = require("naughty")
local gears = require("gears")
local awful = require("awful")
---naughty.notify({ title = "Noti", text = "this is text" })

awful.spawn("bash -c play-manisfest-serries.sh",{
  })

'
