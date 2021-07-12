return function()
    local BoardUtil = require(script.Parent.BoardUtil)

    describe("Ray Testings (no other dependencies)", function()
        it("FireRayInDirection returns the correct values", function()
            local Board = BoardUtil.Create(false)
            BoardUtil.Set(Board, Vector2.new(4,4), true)
            BoardUtil.Set(Board, Vector2.new(5,5), true)

            local collisions = BoardUtil.FireRayInDirection(Board, Vector2.new(1,1), Vector2.new(1,1), function(value)
                return value
            end)
            print(collisions) --> {[1] = true, [2] = true}
            expect(#collisions).to.equal(2)
        end)
        it("FireRayToPoint returns the correct values", function()
            local Board = BoardUtil.Create(false)
            BoardUtil.Set(Board, Vector2.new(4,4), true)
            BoardUtil.Set(Board, Vector2.new(5,5), true)
    
            local collisions = BoardUtil.FireRayToPoint(Board, Vector2.new(1,1), Vector2.new(8,8), function(value)
                return value
            end)
            print(collisions) --> {[1] = true, [2] = true}
            expect(#collisions).to.equal(2)
        end)
    end)
    describe("Proper Vector2 To Int Utils", function()
        it("Converting back and forth should return the same value", function()
            local orig = Vector2.new(8,8)
            local int = BoardUtil.Vector2ToInt(orig)
            expect(BoardUtil.IntToVector2(int)).to.equal(orig)
        end)
        it("All indexes must be unique", function()
            local array = BoardUtil.Create()

            local indexAlreadyExists = false

            for x = 1, 8 do
                for y = 1, 8 do
                    local pos = BoardUtil.Vector2ToInt(x,y)
                    if array[pos] then
                        indexAlreadyExists = true
                        break
                    end
                    array[pos] = true
                end
            end
            expect(indexAlreadyExists).to.equal(false)
        end)
        it("Getting the X value of an int equals the original value", function()
            local orig = Vector2.new(8,5)
            local int = BoardUtil.Vector2ToInt(orig)
            expect(BoardUtil.GetX(int)).to.equal(orig.X)
        end)
        it("Getting the Y value of an int equals the original value", function()
            local orig = Vector2.new(8,5)
            local int = BoardUtil.Vector2ToInt(orig)
            expect(BoardUtil.GetY(int)).to.equal(orig.Y)
        end)
    end)
end