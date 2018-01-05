# Code

def add_binary(a, b)
  (a + b).to_s(2)
end

# Provided Test Cases

Test.describe("Basic tests") do
  Test.assert_equals(add_binary(1,1),"10")
  Test.assert_equals(add_binary(0,1),"1")
  Test.assert_equals(add_binary(1,0),"1")
  Test.assert_equals(add_binary(2,2),"100")
  Test.assert_equals(add_binary(51,12),"111111")
  Test.assert_equals(add_binary(5,9),"1110")
  Test.assert_equals(add_binary(10,10),"10100")
  Test.assert_equals(add_binary(100,100),"11001000")
  Test.assert_equals(add_binary(4096,1),"1000000000001")
  Test.assert_equals(add_binary(0,2174483647),"10000001100110111111110010111111")
end

Test.describe("Random tests") do
def randint(a,b) rand(b-a+1)+a end
def sol_binary(a,b) (a+b).to_s(2) end

40.times do
    top=10**randint(1,32)
    a,b=randint(0,top),randint(0,top)
    Test.it("Testing for "+a.to_s+" + "+b.to_s) do
    Test.assert_equals(add_binary(a,b),sol_binary(a,b),"It should work for random inputs too")
    end
end
end
