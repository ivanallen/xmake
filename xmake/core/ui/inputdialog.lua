--!A cross-platform build utility based on Lua
--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2018, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        inputdialog.lua
--

-- load modules
local log        = require("ui/log")
local rect       = require("ui/rect")
local view       = require("ui/view")
local event      = require("ui/event")
local curses     = require("ui/curses")
local window     = require("ui/window")
local textedit   = require("ui/textedit")
local textdialog = require("ui/textdialog")

-- define module
local inputdialog = inputdialog or textdialog()

-- init dialog
function inputdialog:init(name, bounds, title)

    -- init window
    textdialog.init(self, name, bounds, title)

    -- insert textedit
    self:panel():insert(self:textedit())

    -- resize text
    self:text():bounds().ey = 1
    self:text():invalidate(true)
    self:text():option_set("selectable", false)
end

-- get textedit
function inputdialog:textedit()
    if not self._TEXTEDIT then
        self._TEXTEDIT = textedit:new("inputdialog.textedit", rect{0, 1, self:panel():width(), self:panel():height() - 1})
    end
    return self._TEXTEDIT
end

-- return module
return inputdialog
