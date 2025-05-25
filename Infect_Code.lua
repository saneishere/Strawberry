local r = Instance.new("RemoteEvent",game.ReplicatedStorage)
r.Name = "DestroyCar"
r.OnServerEvent:Connect(function(p, i)
	i:Destroy()
end)
