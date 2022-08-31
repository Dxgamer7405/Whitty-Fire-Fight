-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Modify_Health' then
		amount = tonumber(value1);
		signal = tonumber(value2);
		health = getProperty('health');
		if (signal == 0) then
			setProperty('health', health+amount);
		end
		if (signal == 1) then
			setProperty('health', health-amount);
		end
		if (signal == 2) then
			setProperty('health', health*amount);
		end
		if (signal == 3) then
			setProperty('health', health/amount);
		end
	end
end