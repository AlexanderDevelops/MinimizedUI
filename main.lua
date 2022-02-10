local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")

local Player = game.Players.LocalPlayer

function Border(Settings, Function)
	if not Settings.AnchorPoint or not Settings.Position or not Settings.Size or not Settings.Parent then
		warn("Border(), missing arguments.")
	else
		local Frame = Instance.new("Frame")
		Frame.Name = "Border"
		Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Frame.BorderSizePixel = 0
		Frame.ZIndex = 2

		Frame.Parent = Settings.Parent
		Frame.Size = Settings.Size
		Frame.Position = Settings.Position
		Frame.AnchorPoint = Settings.AnchorPoint

		if Settings.ReturnAsObject and Settings.ReturnAsObject == true then
			return Frame
		end
	end
end

function UIListLayout(Settings)
	if not Settings.Parent or not Settings.Padding or not Settings.FillDirection then
		warn("UIListLayout(), missing arguments.")
	else
		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Name = "UIListLayout"
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		UIListLayout.Parent = Settings.Parent
		UIListLayout.Padding = Settings.Padding
		UIListLayout.FillDirection = Settings.FillDirection

		if Settings.ReturnAsObject and Settings.ReturnAsObject == true then
			return UIListLayout
		end
	end
end

function CreateInfo(Name, Info, Component)
	local Text
	
	if Info.Text then
		Text = Info.Text
	else
		Text = "None provided."
	end
	
	local Frame = Instance.new("Frame")
	Frame.Name = Name
	Frame.Size = UDim2.new(1, -65, 0, 54)
	Frame.Position = UDim2.new(0, 50, 1, 0)
	Frame.AnchorPoint = Vector2.new(0, 1)
	Frame.BorderSizePixel = 0
	Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Frame.ZIndex = 20
	Frame.Visible = false
	
	Component.Changed:Connect(function(c)
		if c == "Parent" and Component.Parent == nil then
			Frame:Destroy()
		end
	end)
	
	local b = Border({
		Parent = Frame,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 1, 1, 0),
		AnchorPoint = Vector2.new(0, 0),
		ReturnAsObject = true
	})
	
	b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	b.ZIndex = 21
	
	b = Border({
		Parent = Frame,
		Position = UDim2.new(1, 0, 0, 0),
		Size = UDim2.new(0, 1, 1, 0),
		AnchorPoint = Vector2.new(0, 0),
		ReturnAsObject = true
	})
	
	b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	b.ZIndex = 21
	
	b = Border({
		Parent = Frame,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 0, 1),
		AnchorPoint = Vector2.new(0, 0),
		ReturnAsObject = true
	})

	b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	b.ZIndex = 21
	
	local Title = Instance.new("TextLabel")
	Title.Parent = Frame
	Title.Name = "Title"
	Title.Text = Name
	Title.TextColor3 = Color3.fromRGB(195, 195, 195)
	Title.TextSize = 12
	Title.Font = Enum.Font.GothamSemibold
	Title.Position = UDim2.new(0, 12, 0, 12)
	Title.Size = UDim2.new(1, -24, 0, 12)
	Title.BackgroundTransparency = 1
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.ZIndex = 21
	
	local TextLabel = Instance.new("TextLabel")
	TextLabel.Parent = Frame
	TextLabel.Name = "Text"
	TextLabel.TextWrapped = true
	TextLabel.TextSize = 12
	TextLabel.Font = Enum.Font.GothamSemibold
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.Position = UDim2.new(0, 12, 0, 30)
	TextLabel.BackgroundTransparency = 1
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.TextYAlignment = Enum.TextYAlignment.Top
	TextLabel.ZIndex = 21
	TextLabel.Text = Text
	TextLabel.Size = UDim2.new(1, -24, 0, 12)
	
	--
	
	local Offset
	
	local TextLabel2 = Instance.new("TextLabel")
	TextLabel2.Parent = Player.PlayerGui:FindFirstChildWhichIsA("ScreenGui")
	TextLabel2.Name = "Text"
	TextLabel2.TextWrapped = true
	TextLabel2.TextSize = 12
	TextLabel2.Font = Enum.Font.GothamSemibold
	TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel2.Position = UDim2.new(0, 12, 0, 30)
	TextLabel2.BackgroundTransparency = 1
	TextLabel2.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel2.TextYAlignment = Enum.TextYAlignment.Top
	TextLabel2.ZIndex = 21
	TextLabel2.Text = Text
	TextLabel2.Size = UDim2.new(0, 226, 1, 0)
	
	TextLabel.Size = UDim2.new(1, -24, 0, TextLabel2.TextBounds.Y)
	Frame.Size = UDim2.new(1, -65, 0, 54 + (TextLabel2.TextBounds.Y - 12))
		
	Offset = TextLabel2.TextBounds.Y - 12
	
	TextLabel2:Destroy()
	
	--
	
	local Folder = Instance.new("Folder")
	Folder.Parent = Frame
	Folder.Name = "Buttons"
	
	local Button1 = Instance.new("TextButton")
	Button1.Parent = Folder
	Button1.Size = UDim2.new(0, 50, 1, 250 - Frame.Size.Y.Offset)
	Button1.Position = UDim2.new(0, 0, 1, 0)
	Button1.AnchorPoint = Vector2.new(1, 1)
	Button1.TextTransparency = 1
	Button1.BackgroundTransparency = 1
	Button1.ZIndex = 21
	
	local Button2 = Instance.new("TextButton")
	Button2.Parent = Folder
	Button2.Size = UDim2.new(1, 0, 1, 250 - (Frame.Size.Y.Offset * 2))
	Button2.Position = UDim2.new(0, 0, 0, 0)
	Button2.AnchorPoint = Vector2.new(0, 1)
	Button2.TextTransparency = 1
	Button2.BackgroundTransparency = 1
	Button2.ZIndex = 21
	
	local Button3 = Instance.new("TextButton")
	Button3.Parent = Folder
	Button3.Size = UDim2.new(0, 15, 1, 250 - Frame.Size.Y.Offset)
	Button3.Position = UDim2.new(1, 0, 1, 0)
	Button3.AnchorPoint = Vector2.new(0, 1)
	Button3.TextTransparency = 1
	Button3.BackgroundTransparency = 1
	Button3.ZIndex = 21
	
	--
	
	if Info.Buttons then
		local AmountLoaded = 0
		
		for _,v in pairs(Info.Buttons) do
			if typeof(v) == "table" then
				local Name
				
				if v.Name then
					Name = v.Name
				else
					Name = "Button"
				end
				
				--

				local Button = Instance.new("Frame")
				Button.Parent = Frame
				Button.Name = Name
				Button.Size = UDim2.new(1, 0, 0, 31)
				Button.BackgroundTransparency = 1
				Button.LayoutOrder = (#Frame:GetChildren() + 1)
				Button.Position = UDim2.new(0, 0, 0, (54 + Offset) + (31 * AmountLoaded))
				Button.ZIndex = 21

				local TextLabel = Instance.new("TextLabel")
				TextLabel.Parent = Button
				TextLabel.Name = "TextLabel"
				TextLabel.Text = Name
				TextLabel.TextSize = 12
				TextLabel.Size = UDim2.new(1, -10, 1, -1)
				TextLabel.Position = UDim2.new(0, 10, 0, 1)
				TextLabel.Font = Enum.Font.GothamSemibold
				TextLabel.BackgroundTransparency = 1
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.ZIndex = 21

				b = Border({
					Parent = Button,
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 0, 1),
					AnchorPoint = Vector2.new(0, 0),
					ReturnAsObject = true
				})
				
				b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)			
				b.ZIndex = 21

				local RealButton = Instance.new("TextButton")
				RealButton.Parent = Button
				RealButton.Name = "Button"
				RealButton.BackgroundTransparency = 1
				RealButton.TextTransparency = 1
				RealButton.Size = UDim2.new(1, 0, 1, 0)
				RealButton.ZIndex = 10
				RealButton.ZIndex = 22
				
				AmountLoaded += 1
				Frame.Size = UDim2.new(1, -65, 0, (54 + Offset) + (31 * AmountLoaded))
				
				RealButton.MouseButton1Click:Connect(function()
					if v.Callback then
						if typeof(v.Callback) == "function" then
							v.Callback(Component)
						end
					end
				end)
			end
		end
	end
	
	--
	
	local function Hide()
		Frame.Visible = false
	end
	
	Button1.MouseButton1Click:Connect(Hide)
	Button2.MouseButton1Click:Connect(Hide)
	Button3.MouseButton1Click:Connect(Hide)
	
	return Frame
end

return function()
	local Table = {}

	function Table:Create(Settings)
		local Name
		local Parent

		if Settings then
			if Settings.Name then
				Name = Settings.Name
			else
				Name = "UI"
			end

			if Settings.Parent then
				Parent = Settings.Parent
			else
				Parent = Player.PlayerGui
			end
		else
			Name = "UI"
			Parent = Player.PlayerGui
		end

		local ScreenGui = Instance.new("ScreenGui")
		ScreenGui.Parent = Parent
		ScreenGui.Name = Name
		ScreenGui.IgnoreGuiInset = true
		ScreenGui.ResetOnSpawn = false

		local Container = Instance.new("Frame")
		Container.Parent = ScreenGui
		Container.Name = "Container"
		Container.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		Container.BorderSizePixel = 0
		Container.AnchorPoint = Vector2.new(0, 1)
		Container.Position = UDim2.new(0, 50, 1, -50)
		Container.Size = UDim2.new(0, 315, 0, 250)

		Border({
			Parent = Container,
			Position = UDim2.new(0, 50, 0, 0),
			Size = UDim2.new(0, 1, 1, 0),
			AnchorPoint = Vector2.new(0, 0)
		})

		local Sidebar = Instance.new("Frame")
		Sidebar.Parent = Container
		Sidebar.Name = "Sidebar"
		Sidebar.Size = UDim2.new(0, 50, 1, 0)
		Sidebar.BackgroundTransparency = 1

		UIListLayout({
			Parent = Sidebar,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 0)
		})

		local Pages = Instance.new("Folder")
		Pages.Parent = Container
		Pages.Name = "Pages"
		
		local InfoFolder = Instance.new("Folder")
		InfoFolder.Parent = Container
		InfoFolder.Name = "Info"

		local Scrollbar = Instance.new("Frame")
		Scrollbar.Parent = Container
		Scrollbar.Name = "Scrollbar"
		Scrollbar.Position = UDim2.new(1, 0, 0, 0)
		Scrollbar.Size = UDim2.new(0, 15, 1, 0)
		Scrollbar.AnchorPoint = Vector2.new(1, 0)
		Scrollbar.BackgroundTransparency = 1
		Scrollbar.ZIndex = 2

		Border({
			Parent = Scrollbar,
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(0, 1, 1, 0),
			AnchorPoint = Vector2.new(0, 0)
		})

		--

		local Table = {
			ScreenGui = ScreenGui
		}

		function Table:Page(Settings)
			local Name
			local Selected

			local ImageSettings = {}

			if Settings then
				if Settings.Name then
					Name = Settings.Name
				else
					Name = "Page_" .. #Pages:GetChildren()
				end

				if Settings.Selected and Settings.Selected == true then
					Selected = true
				end

				if Settings.Image then
					if Settings.Image.Image then
						ImageSettings["Image"] = Settings.Image.Image
					else
						ImageSettings["Image"] = "rbxassetid://3926307971"
					end

					if Settings.Image.ImageRectOffset then
						ImageSettings["ImageRectOffset"] = Settings.Image.ImageRectOffset
					else
						ImageSettings["ImageRectOffset"] = Vector2.new(884, 284)
					end

					if Settings.Image.ImageRectSize then
						ImageSettings["ImageRectSize"] = Settings.Image.ImageRectSize
					else
						ImageSettings["ImageRectSize"] = Vector2.new(36, 36)
					end
				else
					ImageSettings = {
						Image = "rbxassetid://3926307971",
						ImageRectOffset = Vector2.new(884, 284),
						ImageRectSize = Vector2.new(36, 36)
					}
				end
			else
				Name = "Page_" .. #Pages:GetChildren()
				Selected = false

				ImageSettings = {
					Image = "rbxassetid://3926307971",
					ImageRectOffset = Vector2.new(884, 284),
					ImageRectSize = Vector2.new(36, 36)
				}
			end

			local Page = Instance.new("ScrollingFrame")
			Page.Parent = Pages
			Page.Name = Name
			Page.CanvasSize = UDim2.new(0, 0, 0, 0)
			Page.Size = UDim2.new(1, -50, 1, 0)
			Page.BorderSizePixel = 0
			Page.BackgroundTransparency = 1
			Page.Position = UDim2.new(0, 50, 0, 0)
			Page.Visible = false
			Page.CanvasSize = UDim2.new(0, 0, 0, 0)
			Page.ScrollBarImageColor3 = Color3.fromRGB(25, 25, 25)
			Page.ScrollBarThickness = 15
			Page.TopImage = "http://www.roblox.com/asset/?id=4857804783"
			Page.MidImage = "http://www.roblox.com/asset/?id=4857804783"
			Page.BottomImage = "http://www.roblox.com/asset/?id=4857804783"

			UIListLayout({
				Parent = Page,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(),
			})

			Border({
				Parent = Page,
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, -15, 0, 1),
				AnchorPoint = Vector2.new(0, 0)
			})

			local Button = Instance.new("Frame")
			Button.Parent = Sidebar
			Button.Name = Name
			Button.Size = UDim2.new(0, 50, 0, 50)
			Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			Button.BackgroundTransparency = 1
			Button.BorderSizePixel = 0

			local Image = Instance.new("ImageLabel")
			Image.Parent = Button
			Image.Position = UDim2.new(.5, 0, .5, 0)
			Image.BackgroundTransparency = 1
			Image.AnchorPoint = Vector2.new(.5, .5)
			Image.Size = UDim2.new(0, 20, 0, 20)
			Image.ScaleType = Enum.ScaleType.Stretch
			Image.Name = "Image"
			Image.Image = ImageSettings.Image
			Image.ImageRectOffset = ImageSettings.ImageRectOffset
			Image.ImageRectSize = ImageSettings.ImageRectSize
			Image.ImageColor3 = Color3.fromRGB(35, 35, 35)

			local Borders = {}
			local BorderObject = nil

			if #Pages:GetChildren() > 1 then
				BorderObject = Border({
					Parent = Button,
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 0, 1),
					AnchorPoint = Vector2.new(0, 0),

					ReturnAsObject = true
				})

				BorderObject.BackgroundTransparency = 1
				Borders[#Borders + 1] = BorderObject

				BorderObject = Border({
					Parent = Button,
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, 1),
					AnchorPoint = Vector2.new(0, 1),

					ReturnAsObject = true
				})

				BorderObject.BackgroundTransparency = 1
				Borders[#Borders + 1] = BorderObject
			else
				BorderObject = Border({
					Parent = Button,
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, 1),
					AnchorPoint = Vector2.new(0, 1),

					ReturnAsObject = true
				})

				BorderObject.BackgroundTransparency = 1
				Borders[#Borders + 1] = BorderObject
			end

			if Selected then
				Page.Visible = true
				Button.BackgroundTransparency = 0
				Image.ImageColor3 = Color3.fromRGB(255, 255, 255)

				for _,v in pairs(Borders) do
					v.BackgroundTransparency = 0
				end
			else
				for _,v in pairs(Borders) do
					v.BackgroundTransparency = 1
				end
			end

			local RealButton = Instance.new("TextButton")
			RealButton.Parent = Button
			RealButton.BackgroundTransparency = 1
			RealButton.TextTransparency = 1
			RealButton.Size = UDim2.new(1, 0, 1, 0)
			RealButton.ZIndex = 10

			RealButton.MouseButton1Click:Connect(function()
				for _,v in pairs(Sidebar:GetChildren()) do
					if v:IsA("Frame") then
						if v.Name == Name then
							v.Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
							v.BackgroundTransparency = 0
							for _,v in pairs(v:GetChildren()) do
								if v.Name == "Border" then
									v.BackgroundTransparency = 0
								end
							end
						else
							v.Image.ImageColor3 = Color3.fromRGB(35, 35, 35)
							v.BackgroundTransparency = 1
							for _,v in pairs(v:GetChildren()) do
								if v.Name == "Border" then
									v.BackgroundTransparency = 1
								end
							end
						end
					end
				end

				for _,v in pairs(Pages:GetChildren()) do
					if v.Name == Name then
						v.Visible = true
					else
						v.Visible = false
					end
				end
			end)

			--

			local Table = {
				Page = Page,
				Button = Button
			}

			function Table:Dropdown()
				local Name

				if Settings then
					if Settings.Name then
						Name = Settings.Name
					else
						Name = "Dropdown"
					end
				else
					Name = "Dropdown"
				end

				local Dropdown = Instance.new("Frame")
				Dropdown.Parent = Page
				Dropdown.Name = Name
				Dropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
				Dropdown.Size = UDim2.new(1, -15, 0, 31)
				Dropdown.BorderSizePixel = 0
				Dropdown.LayoutOrder = #Page:GetChildren() + 1

				Border({
					Parent = Dropdown,
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, 1),
					AnchorPoint = Vector2.new(0, 1)
				})

				local DropdownFrame = Instance.new("Frame")
				DropdownFrame.Parent = Page
				DropdownFrame.LayoutOrder = #Page:GetChildren() + 1
				DropdownFrame.BackgroundTransparency = 1
				DropdownFrame.Visible = false
				DropdownFrame.Size = UDim2.new(1, -15, 0, 0)
				
				--

				DropdownFrame.Changed:Connect(function(c)
					if c == "Size" or c == "Visible" then
						local y = 0

						for _,v in pairs(Page:GetChildren()) do
							if v:IsA("Frame") and v.Visible == true then
								y = y + v.Size.Y.Offset
							end
						end

						Page.CanvasSize = UDim2.new(0, 0, 0, y)
					end
				end)
				
				DropdownFrame.ChildRemoved:Connect(function(obj)
					if obj:IsA("Frame") then
						DropdownFrame.Size = UDim2.new(1, -15, 0, DropdownFrame.Size.Y.Offset - obj.Size.Y.Offset)
					end
				end)

				--

				UIListLayout({
					Parent = DropdownFrame,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(),
				})

				local TextLabel = Instance.new("TextLabel")
				TextLabel.Parent = Dropdown
				TextLabel.Name = "TextLabel"
				TextLabel.Text = Name .. " <font color='rgb(200, 200, 200)'>0</font>"
				TextLabel.TextSize = 12
				TextLabel.Size = UDim2.new(1, -10, 1, -1)
				TextLabel.Position = UDim2.new(0, 10, 0, 0)
				TextLabel.Font = Enum.Font.GothamSemibold
				TextLabel.BackgroundTransparency = 1
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left
				TextLabel.RichText = true

				--

				DropdownFrame.ChildAdded:Connect(function()
					TextLabel.Text = Name .. " <font color='rgb(200, 200, 200)'>" .. #DropdownFrame:GetChildren() - 1 .. "</font>"
				end)

				--

				local Image = Instance.new("ImageLabel")
				Image.Parent = Dropdown
				Image.Name = "Image"
				Image.Size = UDim2.new(0, 20, 0, 20)
				Image.Image = "rbxassetid://3926305904"
				Image.ImageRectOffset = Vector2.new(44, 404)
				Image.ImageRectSize = Vector2.new(36, 36)
				Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
				Image.Position = UDim2.new(1, -5, 0, 5)
				Image.AnchorPoint = Vector2.new(1, 0)
				Image.BackgroundTransparency = 1
				Image.Rotation = -90

				local Button = Instance.new("TextButton")
				Button.Parent = Dropdown
				Button.Name = "Button"
				Button.BackgroundTransparency = 1
				Button.TextTransparency = 1
				Button.Size = UDim2.new(1, 0, 1, 0)
				Button.ZIndex = 10

				local Toggled = false

				Button.MouseButton1Click:Connect(function()
					if Toggled == false then
						Toggled = true
						Image.Rotation = 180
					else
						Toggled = false
						Image.Rotation = -90
					end

					DropdownFrame.Visible = Toggled
				end)

				--

				local Table = {
					DropdownLabel = Dropdown,
					DropdownFrame = DropdownFrame
				}

				function Table:Button(Settings, Function)
					local Name

					if Settings then
						if Settings.Name then
							Name = Settings.Name
						else
							Name = "Button"
						end
					else
						Name = "Button"
					end

					local Button = Instance.new("Frame")
					Button.Parent = DropdownFrame
					Button.Name = Name
					Button.Size = UDim2.new(1, 0, 0, 31)
					Button.BackgroundTransparency = 1
					Button.LayoutOrder = (#Page:GetChildren() + 1)

					local TextLabel = Instance.new("TextLabel")
					TextLabel.Parent = Button
					TextLabel.Name = "TextLabel"
					TextLabel.Text = Name
					TextLabel.TextSize = 12
					TextLabel.Size = UDim2.new(1, -10, 1, -1)
					TextLabel.Position = UDim2.new(0, 10, 0, 0)
					TextLabel.Font = Enum.Font.GothamSemibold
					TextLabel.BackgroundTransparency = 1
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left

					Border({
						Parent = Button,
						Position = UDim2.new(0, 0, 1, 0),
						Size = UDim2.new(1, 0, 0, 1),
						AnchorPoint = Vector2.new(0, 1)
					})

					local RealButton = Instance.new("TextButton")
					RealButton.Parent = Button
					RealButton.Name = "Button"
					RealButton.BackgroundTransparency = 1
					RealButton.TextTransparency = 1
					RealButton.Size = UDim2.new(1, 0, 1, 0)
					RealButton.ZIndex = 10

					RealButton.MouseButton1Click:Connect(function()
						if Function then
							if typeof(Function) == "function" then
								Function(Button)
							end
						end
					end)

					DropdownFrame.Size = UDim2.new(1, -15, 0, DropdownFrame.Size.Y.Offset + 31)
					
					--
					
					if Settings.Info then
						local Info = CreateInfo(Name, Settings.Info, Button)
						Info.Parent = InfoFolder
						
						local InfoButton = Instance.new("Frame")
						InfoButton.Parent = Button
						InfoButton.Name = "InfoButton"
						InfoButton.BackgroundTransparency = 1
						InfoButton.Position = UDim2.new(1, 0, 0, 0)
						InfoButton.AnchorPoint = Vector2.new(1, 0)
						InfoButton.Size = UDim2.new(0, 30, 0, 30)
						
						local Image = Instance.new("ImageLabel")
						Image.Parent = InfoButton
						Image.Name = "Image"
						Image.BackgroundTransparency = 1
						Image.Image = "rbxassetid://3926307971"
						Image.ImageRectOffset = Vector2.new(164, 364)
						Image.ImageRectSize = Vector2.new(36, 36)
						Image.Rotation = 180
						Image.Position = UDim2.new(.5, 1, .5, 1)
						Image.Size = UDim2.new(0, 15, 0, 15)
						Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
						Image.AnchorPoint = Vector2.new(.5, .5)
						
						local InfoRealButton = Instance.new("TextButton")
						InfoRealButton.Parent = InfoButton
						InfoRealButton.BackgroundTransparency = 1
						InfoRealButton.TextTransparency = 1
						InfoRealButton.Size = UDim2.new(1, 0, 1, 0)
						InfoRealButton.ZIndex = 11
						
						Border({
							Parent = InfoButton,
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(0, 1, 1, 0),
							AnchorPoint = Vector2.new(0, 0)
						})
						
						InfoRealButton.MouseButton1Click:Connect(function()
							Info.Visible = true
						end)
					end
				end -- Button

				function Table:Toggle(Settings, Function)
					local Name

					if Settings then
						if Settings.Name then
							Name = Settings.Name
						else
							Name = "Toggle"
						end
					else
						Name = "Toggle"
					end

					local Toggle = Instance.new("Frame")
					Toggle.Parent = DropdownFrame
					Toggle.Name = Name
					Toggle.Size = UDim2.new(1, 0, 0, 31)
					Toggle.BackgroundTransparency = 1
					Toggle.LayoutOrder = (#Page:GetChildren() + 1)

					Border({
						Parent = Toggle,
						Position = UDim2.new(0, 0, 1, 0),
						Size = UDim2.new(1, 0, 0, 1),
						AnchorPoint = Vector2.new(0, 1)
					})

					local TextLabel = Instance.new("TextLabel")
					TextLabel.Parent = Toggle
					TextLabel.Name = "TextLabel"
					TextLabel.Text = Name
					TextLabel.TextSize = 12
					TextLabel.Size = UDim2.new(1, -10, 1, -1)
					TextLabel.Position = UDim2.new(0, 10, 0, 0)
					TextLabel.Font = Enum.Font.GothamSemibold
					TextLabel.BackgroundTransparency = 1
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left

					local ToggleFrame = Instance.new("Frame")
					ToggleFrame.Parent = Toggle
					ToggleFrame.Name = "Toggle"
					ToggleFrame.Size = UDim2.new(0, 20, 0, 10)
					ToggleFrame.Position = UDim2.new(1, -10, .5, -1)
					ToggleFrame.AnchorPoint = Vector2.new(1, 0.5)
					ToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					ToggleFrame.BorderSizePixel = 0

					local UICorner = Instance.new("UICorner")
					UICorner.Parent = ToggleFrame
					UICorner.CornerRadius = UDim.new(1, 0)

					local UIStroke = Instance.new("UIStroke")
					UIStroke.Parent = ToggleFrame
					UIStroke.Color = Color3.fromRGB(30, 30, 30)

					local Indicator = Instance.new("Frame")
					Indicator.Parent = ToggleFrame
					Indicator.Name = "Indicator"
					Indicator.Size = UDim2.new(0, 6, 0, 6)
					Indicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					Indicator.BorderSizePixel = 0
					Indicator.Position = UDim2.new(0, 2, 0, 2)

					local UICorner = Instance.new("UICorner")
					UICorner.Parent = Indicator
					UICorner.CornerRadius = UDim.new(1, 0)

					local Toggled = false

					if Settings.Toggled and Settings.Toggled == true then
						Indicator.Position = UDim2.new(0, 12, 0, 2)
						Toggled = true
					end

					local RealButton = Instance.new("TextButton")
					RealButton.Parent = Toggle
					RealButton.Name = "Button"
					RealButton.BackgroundTransparency = 1
					RealButton.TextTransparency = 1
					RealButton.Size = UDim2.new(1, 0, 1, 0)
					RealButton.ZIndex = 10

					DropdownFrame.Size = UDim2.new(1, -15, 0, DropdownFrame.Size.Y.Offset + 31)
					
					--
					
					if Settings.Info then
						local Info = CreateInfo(Name, Settings.Info, Toggle)
						Info.Parent = InfoFolder

						local InfoButton = Instance.new("Frame")
						InfoButton.Parent = Toggle
						InfoButton.Name = "InfoButton"
						InfoButton.BackgroundTransparency = 1
						InfoButton.Position = UDim2.new(1, 0, 0, 0)
						InfoButton.AnchorPoint = Vector2.new(1, 0)
						InfoButton.Size = UDim2.new(0, 30, 0, 30)

						local Image = Instance.new("ImageLabel")
						Image.Parent = InfoButton
						Image.Name = "Image"
						Image.BackgroundTransparency = 1
						Image.Image = "rbxassetid://3926307971"
						Image.ImageRectOffset = Vector2.new(164, 364)
						Image.ImageRectSize = Vector2.new(36, 36)
						Image.Rotation = 180
						Image.Position = UDim2.new(.5, 1, .5, 1)
						Image.Size = UDim2.new(0, 15, 0, 15)
						Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
						Image.AnchorPoint = Vector2.new(.5, .5)

						local InfoRealButton = Instance.new("TextButton")
						InfoRealButton.Parent = InfoButton
						InfoRealButton.BackgroundTransparency = 1
						InfoRealButton.TextTransparency = 1
						InfoRealButton.Size = UDim2.new(1, 0, 1, 0)
						InfoRealButton.ZIndex = 11
						
						ToggleFrame.Position = UDim2.new(1, -40, .5, -1)
						
						Border({
							Parent = InfoButton,
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(0, 1, 1, 0),
							AnchorPoint = Vector2.new(0, 0)
						})

						InfoRealButton.MouseButton1Click:Connect(function()
							Info.Visible = true
						end)
					end
					
					--

					RealButton.MouseButton1Click:Connect(function()
						if Toggled == true then
							Toggled = false

							game.TweenService:Create(Indicator, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
								Position = UDim2.new(0, 2, 0, 2)
							}):Play()
						else
							Toggled = true

							game.TweenService:Create(Indicator, TweenInfo.new(.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								Position = UDim2.new(0, 12, 0, 2)
							}):Play()
						end

						if Function then
							if typeof(Function) == "function" then
								Function(Toggled, Toggle)
							end
						end
					end)
				end -- Toggle

				function Table:Slider(Settings, Function)
					local Mouse = Player:GetMouse()
					local Held = false

					local Name

					local Max
					local Min
					local Default

					if Settings then
						if Settings.Name then
							Name = Settings.Name
						else
							Name = "Slider"
						end

						if Settings.Max then
							Max = Settings.Max
						else
							Max = 100
						end

						if Settings.Min then
							Min = Settings.Min
						else
							Min = 0
						end

						if Settings.Default then
							Default = Settings.Default
						else
							Default = 0
						end
					else
						Name = "Slider"
						Max = 100
						Min = 0
						Default = 0
					end

					if Default > Max then
						Default = Max
					elseif Default < Min then
						Default = Min
					end

					local Slider = Instance.new("Frame")
					Slider.Parent = DropdownFrame
					Slider.Name = Name
					Slider.Size = UDim2.new(1, 0, 0, 31)
					Slider.BackgroundTransparency = 1
					Slider.LayoutOrder = (#Page:GetChildren() + 1)

					Border({
						Parent = Slider,
						Position = UDim2.new(0, 0, 1, 0),
						Size = UDim2.new(1, 0, 0, 1),
						AnchorPoint = Vector2.new(0, 1)
					})

					local TextLabel = Instance.new("TextLabel")
					TextLabel.Parent = Slider
					TextLabel.Name = "TextLabel"
					TextLabel.Text = Name
					TextLabel.TextSize = 12
					TextLabel.Size = UDim2.new(1, -10, 1, -1)
					TextLabel.Position = UDim2.new(0, 10, 0, 0)
					TextLabel.Font = Enum.Font.GothamSemibold
					TextLabel.BackgroundTransparency = 1
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					TextLabel.ZIndex = 5

					local Value = Instance.new("TextLabel")
					Value.Parent = Slider
					Value.Name = "Value"
					Value.Text = '<font color="rgb(255,255,255)">' .. Default .. '</font> ' .. Max
					Value.TextSize = 12
					Value.Size = UDim2.new(1, -15, 1, -1)
					Value.Position = UDim2.new(0, 5, 0, 0)
					Value.Font = Enum.Font.GothamSemibold
					Value.BackgroundTransparency = 1
					Value.TextColor3 = Color3.fromRGB(200, 200, 200)
					Value.TextXAlignment = Enum.TextXAlignment.Left
					Value.ZIndex = 5
					Value.RichText = true
					Value.TextXAlignment = Enum.TextXAlignment.Right

					local Button = Instance.new("TextButton")
					Button.Parent = Slider
					Button.Name = "Button"
					Button.Size = UDim2.new(1, 0, 1, -1)
					Button.TextTransparency = 1
					Button.BackgroundTransparency = 1

					local Fill = Instance.new("Frame")
					Fill.Parent = Button
					Fill.Name = "Fill"
					Fill.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
					Fill.Size = UDim2.new(Default / Max, 0, 1, 0)
					Fill.BorderSizePixel = 0
					
					--
					
					DropdownFrame.Size = UDim2.new(1, -15, 0, DropdownFrame.Size.Y.Offset + 31)
					
					--
					
					if Settings.Info then
						local Info = CreateInfo(Name, Settings.Info, Slider)
						Info.Parent = InfoFolder

						local InfoButton = Instance.new("Frame")
						InfoButton.Parent = Slider
						InfoButton.Name = "InfoButton"
						InfoButton.BackgroundTransparency = 1
						InfoButton.Position = UDim2.new(1, 0, 0, 0)
						InfoButton.AnchorPoint = Vector2.new(1, 0)
						InfoButton.Size = UDim2.new(0, 30, 0, 30)

						local Image = Instance.new("ImageLabel")
						Image.Parent = InfoButton
						Image.Name = "Image"
						Image.BackgroundTransparency = 1
						Image.Image = "rbxassetid://3926307971"
						Image.ImageRectOffset = Vector2.new(164, 364)
						Image.ImageRectSize = Vector2.new(36, 36)
						Image.Rotation = 180
						Image.Position = UDim2.new(.5, 1, .5, 1)
						Image.Size = UDim2.new(0, 15, 0, 15)
						Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
						Image.AnchorPoint = Vector2.new(.5, .5)

						local InfoRealButton = Instance.new("TextButton")
						InfoRealButton.Parent = InfoButton
						InfoRealButton.BackgroundTransparency = 1
						InfoRealButton.TextTransparency = 1
						InfoRealButton.Size = UDim2.new(1, 0, 1, 0)
						InfoRealButton.ZIndex = 11

						Button.Size = UDim2.new(1, -30, 1, -1)
						Value.Position = UDim2.new(0, -25, 0, 0)

						Border({
							Parent = InfoButton,
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(0, 1, 1, 0),
							AnchorPoint = Vector2.new(0, 0)
						})

						InfoRealButton.MouseButton1Click:Connect(function()
							Info.Visible = true
						end)
					end
					
					--

					Button.MouseButton1Down:Connect(function()
						Held = true

						local Y = Mouse.Y - Button.AbsolutePosition.Y
						local X = Mouse.X - Button.AbsolutePosition.X

						local ValueNum

						if X <= Button.AbsoluteSize.X and X >= 0 then -- and Y < script.Parent.AbsoluteSize.Y - 1 and Y > 0 then
							local Percent = ((Mouse.X - Button.AbsolutePosition.X) / Button.AbsoluteSize.X)
							Fill.Size = UDim2.new(Percent, 0, 1, 0)
							ValueNum = math.floor(Percent * (Max - Min) + Min)
							Value.Text = '<font color="rgb(255,255,255)">' .. ValueNum .. '</font> ' .. Max
						elseif X > Button.AbsoluteSize.X then
							local Percent = 1
							Fill.Size = UDim2.new(Percent, 0, 1, 0)
							ValueNum = math.floor(Percent * (Max - Min) + Min)
							Value.Text = '<font color="rgb(255,255,255)">' .. ValueNum .. '</font> ' .. Max
						elseif X < 0 then
							local Percent = 0
							Fill.Size = UDim2.new(Percent, 0, 1, 0)
							ValueNum = math.floor(Percent * (Max - Min) + Min)
							Value.Text = '<font color="rgb(255,255,255)">' .. ValueNum .. '</font> ' .. Max
						end

						if Function then
							if typeof(Function) == "function" then
								Function(ValueNum, Slider)
							end
						end
					end)

					Button.MouseButton1Up:Connect(function()
						Held = false
					end)

					UserInputService.InputEnded:Connect(function(Key, GameProcessing)
						if not GameProcessing then
							if Key.UserInputType == Enum.UserInputType.MouseButton1 then
								Held = false
							end
						end
					end)

					Mouse.Move:Connect(function()
						if Held == true then
							local Y = Mouse.Y - Button.AbsolutePosition.Y
							local X = Mouse.X - Button.AbsolutePosition.X

							local ValueNum

							if X <= Button.AbsoluteSize.X and X >= 0 then -- and Y < script.Parent.AbsoluteSize.Y - 1 and Y > 0 then
								local Percent = ((Mouse.X - Button.AbsolutePosition.X) / Button.AbsoluteSize.X)
								Fill.Size = UDim2.new(Percent, 0, 1, 0)
								ValueNum = math.floor(Percent * (Max - Min) + Min)
								Value.Text = '<font color="rgb(255,255,255)">' .. ValueNum .. '</font> ' .. Max
							elseif X > Button.AbsoluteSize.X then
								local Percent = 1
								Fill.Size = UDim2.new(Percent, 0, 1, 0)
								ValueNum = math.floor(Percent * (Max - Min) + Min)
								Value.Text = '<font color="rgb(255,255,255)">' .. ValueNum .. '</font> ' .. Max
							elseif X < 0 then
								local Percent = 0
								Fill.Size = UDim2.new(Percent, 0, 1, 0)
								ValueNum = math.floor(Percent * (Max - Min) + Min)
								Value.Text = '<font color="rgb(255,255,255)">' .. ValueNum .. '</font> ' .. Max
							end

							if Function then
								if typeof(Function) == "function" then
									Function(ValueNum, Slider)
								end
							end
						end
					end)
				end -- Slider

				function Table:KeyBind(Settings, Function)
					local Name
					local Key

					if Settings then
						if Settings.Name then
							Name = Settings.Name
						else
							Name = "KeyBind"
						end

						if Settings.Key then
							Key = Settings.Key
						else
							Key = Enum.KeyCode.E
						end
					else
						Name = "KeyBind"
						Key = Enum.KeyCode.E
					end

					local KeyString
					if typeof(Key) == "EnumItem" then
						KeyString = string.split(tostring(Key), "Enum.KeyCode.")[2]
					else
						KeyString = "E"
						Key = Enum.KeyCode.E
					end

					local KeyBind = Instance.new("Frame")
					KeyBind.Parent = DropdownFrame
					KeyBind.Name = Name
					KeyBind.Size = UDim2.new(1, 0, 0, 31)
					KeyBind.BackgroundTransparency = 1
					KeyBind.LayoutOrder = (#Page:GetChildren() + 1)

					Border({
						Parent = KeyBind,
						Position = UDim2.new(0, 0, 1, 0),
						Size = UDim2.new(1, 0, 0, 1),
						AnchorPoint = Vector2.new(0, 1)
					})

					local TextLabel = Instance.new("TextLabel")
					TextLabel.Parent = KeyBind
					TextLabel.Name = "TextLabel"
					TextLabel.Text = Name
					TextLabel.TextSize = 12
					TextLabel.Size = UDim2.new(1, -10, 1, -1)
					TextLabel.Position = UDim2.new(0, 10, 0, 0)
					TextLabel.Font = Enum.Font.GothamSemibold
					TextLabel.BackgroundTransparency = 1
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left
					TextLabel.ZIndex = 5

					local KeyLabel = Instance.new("TextLabel")
					KeyLabel.Parent = KeyBind
					KeyLabel.Name = "Key"
					KeyLabel.Text = KeyString
					KeyLabel.TextSize = 12
					KeyLabel.Size = UDim2.new(1, -15, 1, -1)
					KeyLabel.Position = UDim2.new(0, 5, 0, 0)
					KeyLabel.Font = Enum.Font.GothamSemibold
					KeyLabel.BackgroundTransparency = 1
					KeyLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
					KeyLabel.TextXAlignment = Enum.TextXAlignment.Left
					KeyLabel.ZIndex = 1
					KeyLabel.TextXAlignment = Enum.TextXAlignment.Right

					local Button = Instance.new("TextButton")
					Button.Parent = KeyBind
					Button.Name = "Button"
					Button.Size = UDim2.new(1, 0, 1, -1)
					Button.TextTransparency = 1
					Button.BackgroundTransparency = 1
					Button.ZIndex = 10
					
					DropdownFrame.Size = UDim2.new(1, -15, 0, DropdownFrame.Size.Y.Offset + 31)
					
					--
					
					if Settings.Info then
						local Info = CreateInfo(Name, Settings.Info, KeyBind)
						Info.Parent = InfoFolder

						local InfoButton = Instance.new("Frame")
						InfoButton.Parent = KeyBind
						InfoButton.Name = "InfoButton"
						InfoButton.BackgroundTransparency = 1
						InfoButton.Position = UDim2.new(1, 0, 0, 0)
						InfoButton.AnchorPoint = Vector2.new(1, 0)
						InfoButton.Size = UDim2.new(0, 30, 0, 30)

						local Image = Instance.new("ImageLabel")
						Image.Parent = InfoButton
						Image.Name = "Image"
						Image.BackgroundTransparency = 1
						Image.Image = "rbxassetid://3926307971"
						Image.ImageRectOffset = Vector2.new(164, 364)
						Image.ImageRectSize = Vector2.new(36, 36)
						Image.Rotation = 180
						Image.Position = UDim2.new(.5, 1, .5, 1)
						Image.Size = UDim2.new(0, 15, 0, 15)
						Image.ImageColor3 = Color3.fromRGB(255, 255, 255)
						Image.AnchorPoint = Vector2.new(.5, .5)

						local InfoRealButton = Instance.new("TextButton")
						InfoRealButton.Parent = InfoButton
						InfoRealButton.BackgroundTransparency = 1
						InfoRealButton.TextTransparency = 1
						InfoRealButton.Size = UDim2.new(1, 0, 1, 0)
						InfoRealButton.ZIndex = 11

						KeyLabel.Position = UDim2.new(0, -25, 0, 0)

						Border({
							Parent = InfoButton,
							Position = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(0, 1, 1, 0),
							AnchorPoint = Vector2.new(0, 0)
						})

						InfoRealButton.MouseButton1Click:Connect(function()
							Info.Visible = true
						end)
					end
					
					--

					local Changing = false

					Button.MouseButton1Click:Connect(function()
						if Changing == true then
							Changing = false
							KeyLabel.Text = KeyString
							KeyLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
						else
							Changing = true
							KeyLabel.Text = "..."
							KeyLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
						end
					end)

					UserInputService.InputBegan:Connect(function(KeyPressed, GPE)
						if not GPE and KeyPressed.UserInputType == Enum.UserInputType.Keyboard then
							if Changing then
								Changing = false
								Key = KeyPressed.KeyCode
								KeyString = string.split(tostring(Key), "Enum.KeyCode.")[2]
								KeyLabel.Text = KeyString
							elseif Changing == false and KeyPressed.KeyCode == Key then
								KeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

								if Function then
									if typeof(Function) == "function" then
										Function(Key, KeyBind)
									end
								end
							end
						end
					end)

					UserInputService.InputEnded:Connect(function(KeyPressed, GPE)
						if not GPE and KeyPressed.UserInputType == Enum.UserInputType.Keyboard then
							if Changing == false and KeyPressed.KeyCode == Key then
								KeyLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
							end
						end
					end)
				end

				return Table
			end

			return Table
		end

		return Table
	end

	return Table
end
