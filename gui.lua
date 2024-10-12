function loadGUI()
    term.clear()
    term.setCursorPos(1,1)
    local x,y = term.getSize()
    term.write("The mine time")--Upper line--
    i=0
    while i<51 do
        term.write("-")
        i=i+1
    end
    term.setCursorPos(x/4, 2)
    
    --Horisontal separator--
    i=2
    while i<y+2 do
        write("|")
        term.setCursorPos(x/4, i)
        i=i+1
    end

    --Menu--
    term.setBackgroundColor(128)
    term.setCursorPos(1,3)
    func = {"Connect", "Print", "Settings", "Clear", "Exit"}
    i= 1
    b= 4
    while i-1<#func do
        if i==5 then
            term.setBackgroundColor(16384)
        end

        --to end line--
        add = x/4-string.len(func[i])
        write(func[i])
        c=0
        while c<add-2 do
            write(" ")
            c=c+1
        end


        term.setCursorPos(1,b+1)
        i= i+1
        b= b+2
    end
    term.setCursorPos(1,y-5)

    term.setBackgroundColor(32768)
    i=0
    while i<x/4-2 do
        write("-")
        i=i+1
    end
end

function msgbox()
    local x,y = term.getSize()
    term.setCursorPos(1,y-4)
    write("Exit?")
    term.setCursorPos(2, y-2)
    term.setBackgroundColor(8192)
    write("No")
    term.setCursorPos(x/4-4, y-2)
    term.setBackgroundColor(16384)
    write("Yes")

end

function buttonListener()
    while true do
        local x,y = term.getSize()
        local event, button, cx, cy = os.pullEvent("mouse_click")
        if cx<x/4 and cy==11 then
            msgbox()
        elseif cx<4 and cy==17 then
            term.setBackgroundColor(32768)
            loadGUI()
        elseif cx<11 and cy==17 then
            term.setBackgroundColor(32768)
            term.clear()
            term.setCursorPos(1,1)
            break
        end
    end
end


loadGUI()
buttonListener()