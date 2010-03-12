require 'twitter'
trends =  Twitter::Trends.current
trends.each do | trend |
 puts trend.name
end
