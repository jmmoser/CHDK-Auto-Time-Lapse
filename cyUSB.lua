-- Justin Moser 2013

props=require("propcase")
tv=get_prop(props.TV)

if call_event_proc('DispDev_EnableEventProc') == -1 then
 if call_event_proc('DispDev.Create') == -1 then
  error('eventprocs not found')
 end
end

if get_prop(102)~=1 then error('Set drive mode to Continuous') 
end

if get_prop(222)~=0 then error('Set image quality to L')
end

if get_prop(149)~=100 then error('Set ISO to 100')
end

repeat
sleep(50)
g=get_usb_power()
until g>0

set_record(true)
while not get_mode() do
  sleep(100)
end

sleep(200)
set_zoom(43)
sleep(2000)

sleep(200)
set_prop(6,4)
sleep(200)
set_capture_mode(2)
sleep(200)
set_tv96_direct(960)
sleep(200)

sleep(500)
set_focus(30480)
sleep(1000)
press("shoot_half")
sleep(1500)
call_event_proc('DispCon_TurnOffDisplay')
sleep(500)
press("shoot_full")

repeat
sleep(50)
g=get_usb_power()
until g>0

release("shoot_full")
sleep(800)
post_levent_to_ui('PressPowerButton')