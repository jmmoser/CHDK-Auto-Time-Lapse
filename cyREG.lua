props=require("propcase")
tv=get_prop(props.TV)

if call_event_proc('DispDev_EnableEventProc') == -1 then
 if call_event_proc('DispDev.Create') == -1 then
  error('eventprocs not found')
 end
end

set_record(true)
while not get_mode() do
  sleep(100)
end

print("Welcome")
print("Do not obstruct the lens.")
sleep(2000)
set_zoom(43)
sleep(3000)

if get_prop(102)~=1 then error('Set drive mode to Continuous') 
end

if get_prop(222)~=0 then error('Set image quality to L')
end

if get_prop(149)~=100 then error('Set ISO to 100')
end

sleep(200)
set_prop(6,4)
sleep(200)
set_capture_mode(2)
sleep(200)
set_tv96_direct(982)
sleep(200)
cls()

print("Subject distance set at:")
sleep(500)
print("30.48m / 100ft")
sleep(500)
print("Please fly accordingly")
sleep(500)
set_focus(30480)
sleep(1000)
press("shoot_half")
sleep(500)

cls()
print("VERY IMPORTANT!!!")
sleep(1000)
print("Please press 'Func.Set'   button to end script")
sleep(4000)
cls()
print("Screen will now shut off to maximize battery life")
sleep(2000)
print("Have a good flight!")
sleep(1000)
cls()

sleep(500)
call_event_proc('DispCon_TurnOffDisplay')
sleep(500)
press("shoot_full")
wait_click(0)
if is_key("set") then release("shoot_full")
sleep(200)
release("shoot_half")
call_event_proc('DispCon_TurnOnDisplay')
sleep(200)
set_zoom(0)
sleep(2000)
print("Shutting Down")
sleep(1000)
post_levent_to_ui('PressPowerButton')
end