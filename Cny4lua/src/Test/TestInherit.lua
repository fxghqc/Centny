Account = {
  balance = 0
}

function Account:new (o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Account:deposit (v)
  self.balance = self.balance + v
end

function Account:withdraw (v)
  if v > self.balance then error"insufficient funds" end
  self.balance = self.balance - v
end
a=Account:new()
a:deposit(1000)
a:withdraw(1000)
SpecialAccount = Account:new()
function SpecialAccount:withdraw (v)
  if v - self.balance >= self:getLimit() then
    error"insufficient funds"
  end
  self.balance = self.balance - v
end

function SpecialAccount:getLimit ()
  return self.limit or 0
end
s = SpecialAccount:new{limit=100.00}
s:deposit(100.00)
function ss() end
local v,err=pcall()
print(err)