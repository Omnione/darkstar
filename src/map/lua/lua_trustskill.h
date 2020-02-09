/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#ifndef _LUATRUSTSKILL_H
#define _LUATRUSTSKILL_H

#include "../../common/cbasetypes.h"
#include "../../common/lua/lunar.h"

class CTrustWeaponSkill;

class CLuaTrustSkill
{
    CTrustWeaponSkill *m_PLuaTrustSkill;
public:

    static const char className[];
    static Lunar<CLuaTrustSkill>::Register_t methods[];

    CLuaTrustSkill(lua_State*);
    CLuaTrustSkill(CTrustWeaponSkill*);

    CTrustWeaponSkill* GetTrustSkill() const
    {
        return m_PLuaTrustSkill;
    }
    int32 getTP(lua_State*);
    int32 getHPP(lua_State*);
    int32 getID(lua_State*);
    int32 getParam(lua_State*);
    int32 isAoE(lua_State*);
    int32 isConal(lua_State*);
    int32 isSingle(lua_State*);
    int32 hasMissMsg(lua_State*);
    int32 setMsg(lua_State*);
    int32 getMsg(lua_State*);
    int32 getTotalTargets(lua_State*);
};

#endif
