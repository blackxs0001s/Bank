-- Dash Controller Script (วางใน LocalScript)
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- ตั้งค่าระยะ Dash หากยังไม่มี
_G.DashDistance = _G.DashDistance or 100

-- ยกเลิกการผูกปุ่มเดิมก่อน
pcall(function()
	ContextActionService:UnbindAction("CustomDash")
end)

-- ฟังก์ชัน Dash
local function dashAction(actionName, inputState)
	if inputState == Enum.UserInputState.Begin then
		local character = player.Character
		if not character or not character:FindFirstChild("HumanoidRootPart") then return end

		local rootPart = character.HumanoidRootPart
		local direction = rootPart.CFrame.LookVector
		local distance = _G.DashDistance or 100

		-- วาร์ปไปข้างหน้า
		rootPart.CFrame = rootPart.CFrame + (direction * distance)
	end
end

-- ผูกปุ่ม Q
ContextActionService:BindAction("CustomDash", dashAction, false, Enum.KeyCode.Q)
