/*
 * NeoEventHandler.cpp
 *
 *  Created on: 2016年1月21日
 *      Author: neo
 */

#include "NeoEventHandler.h"
#include "stdafx.h"
#include "NeoGameLogic.h"
#include <algorithm>
NeoEventHandler::NeoEventHandler()
{
	// TODO 自动生成的构造函数存根

}

NeoEventHandler::~NeoEventHandler()
{
	// TODO 自动生成的析构函数存根
	ClearAddtionalEventHandler();
}

bool NeoEventHandler::OnEvent(const irr::SEvent& event)
{
	switch (event.EventType)
	{
	case EET_KEY_INPUT_EVENT:
	{
		char in_key[4];
		sprintf(in_key, "%d", static_cast<int>(event.KeyInput.Key));
		NeoGameLogic::getInstance()->TriggerEvent(0, 2, in_key,
				event.KeyInput.PressedDown ? "1" : "0");
		break;
	}
	case EET_MOUSE_INPUT_EVENT:
	{
		//是否为按下事件
		bool pressdown = true;
		//是否为滚轮事件
		bool wheel = false;
		//是否为能捕捉的事件
		bool getEvent = true;
		//哪个鼠标键
		char* button;
		switch (event.MouseInput.Event)
		{
		case EMIE_LMOUSE_PRESSED_DOWN:
		{
			pressdown = true;
			button = "L";
			break;
		}
		case EMIE_RMOUSE_PRESSED_DOWN:
		{
			pressdown = true;
			button = "R";
			break;
		}
		case EMIE_LMOUSE_LEFT_UP:
		{
			pressdown = false;
			button = "L";
			break;
		}
		case EMIE_RMOUSE_LEFT_UP:
		{
			pressdown = false;
			button = "R";
			break;
		}
		case EMIE_MOUSE_WHEEL:
		{
			wheel = true;
			char in_val[4];
			sprintf(in_val, "%.0f", static_cast<float>(event.MouseInput.Wheel));
			NeoGameLogic::getInstance()->TriggerEvent(1, 2, "W", in_val);
			break;
		}
		default:
			getEvent = false;
			break;
		}
		if (getEvent && !wheel)
		{
			NeoGameLogic::getInstance()->TriggerEvent(1, 2, button,
					pressdown ? "1" : "0");
		}
		break;
	}
	default:
		break;
	}
	NeoGraphics::getInstance()->getUIRenderer()->injectEvent(event);
	for (irr::IEventReceiver*receiver : additional_receivers)
	{
		receiver->OnEvent(event);
	}
	return false;
}

void NeoEventHandler::AddAdditionalEventHandler(irr::IEventReceiver* handler)
{
	additional_receivers.push_back(handler);
}

void NeoEventHandler::RemoveAddtionalEventHandler(irr::IEventReceiver* handler)
{
	auto it = std::find(additional_receivers.begin(),
			additional_receivers.end(), handler);
	if (it != additional_receivers.end())
	{
		additional_receivers.erase(it);
	}
}

void NeoEventHandler::ClearAddtionalEventHandler()
{
	additional_receivers.clear();
}
