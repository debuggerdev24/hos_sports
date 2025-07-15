import 'dart:convert';

/// data : [{"user_id":"182","phone_number":" 14169039836","firstname":"George","lastname":"Kostoulias","area_code":"M1R3S3","email":"gkostoulias@gmail.com","password":"U2xhbWR1bmsxIQ==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"11","unpaid_game":"5","registered_on":"2022-09-09 11:59:20","is_verify":"1","device_type":"1","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"43.693971","user_longitude":"-79.335831","user_time_zone":"America/Toronto","device_version":"14|4.4|SM-G990W|EST","schedule_id":"2236","team_name":"Bolts","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"E","goalies":"1","playoff":"1","save_game":"0","date":"2024-03-13","time":"09:30 PM","latitude":"43.8291323","longitude":"-79.2516358","game_duration":"60","address":"Canlan Sports, Dynamic Drive, Scarborough, ON, Canada","game_datetime":"2024-03-13 21:30:00","available_goalies":"1","history_goalies":"1","game_status":"completed","total_time":"2024-03-13 22:30:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"529","phone_number":"6473907503","firstname":"Todd","lastname":"Boyd","area_code":"M1K3B6","email":"tboyd42@gmail.com","password":"TUJAb3IyMDAx","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"1","unpaid_game":"5","registered_on":"2023-11-09 18:09:22","is_verify":"1","device_type":"2","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"43.740407","user_longitude":"-79.274589","user_time_zone":"America/Toronto","device_version":"17.3.1|9.5|iPhone16,1|EDT","schedule_id":"2222","team_name":"The Horde","rink":"159 Dynamic Dr","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"1","save_game":"0","date":"2024-03-11","time":"07:15 PM","latitude":"43.829124","longitude":"-79.251634","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2024-03-11 19:15:00","available_goalies":"1","history_goalies":"1","game_status":"completed","total_time":"2024-03-11 20:15:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"431","phone_number":" 14165586456","firstname":"Alex","lastname":"Lamanna","area_code":"L1W1K2","email":"alxndr.lamanna@hotmail.com","password":"QWxtbzE1OTAh","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"7","unpaid_game":"5","registered_on":"2023-07-09 20:42:48","is_verify":"1","device_type":"1","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"43.773222","user_longitude":"-79.474742","user_time_zone":"America/Toronto","device_version":"14|4.4|Pixel 6|EST","schedule_id":"2182","team_name":"Ice Holes","rink":"159 Dynamic Dr","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","date":"2024-02-18","time":"09:15 PM","latitude":"43.829154588468","longitude":"-79.251640811563","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2024-02-18 21:15:00","available_goalies":"1","history_goalies":"1","game_status":"completed","total_time":"2024-02-18 22:15:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"327","phone_number":" 12893385599","firstname":"david","lastname":"thompson","area_code":"l9l1s2","email":"dave@thompsondalee.com","password":"SG9zc3BvcnRzMjAyMyo=","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"6","unpaid_game":"5","registered_on":"2023-04-27 21:08:32","is_verify":"1","device_type":"1","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"America/Toronto","device_version":"13|4.4|SM-A515W|EST","schedule_id":"1806","team_name":"brew street","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"E","goalies":"1","playoff":"0","save_game":"0","date":"2023-09-29","time":"09:15 PM","latitude":"44.0630541","longitude":"-79.4411499","game_duration":"60","address":"Canlan Sports, Dynamic Drive, Scarborough, ON, Canada","game_datetime":"2023-09-29 21:15:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-09-29 22:15:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"411","phone_number":"4165712490","firstname":"Alexander","lastname":"bond","area_code":"L1T3Y2","email":"bond5080@mylaurier.ca","password":"QXZlbnRhZG9yU1ZKNzch","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"3","unpaid_game":"5","registered_on":"2023-06-22 23:15:11","is_verify":"1","device_type":"2","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"43.858737","user_longitude":"-79.065262","user_time_zone":"America/Toronto","device_version":"16.6.1|9.3|iPhone 11|EDT","schedule_id":"1781","team_name":"Knights","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"1","save_game":"0","date":"2023-08-24","time":"07:30 PM","latitude":"43.829132","longitude":"-79.251633","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2023-08-24 19:30:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-08-24 20:30:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"411","phone_number":"4165712490","firstname":"Alexander","lastname":"bond","area_code":"L1T3Y2","email":"bond5080@mylaurier.ca","password":"QXZlbnRhZG9yU1ZKNzch","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"3","unpaid_game":"5","registered_on":"2023-06-22 23:15:11","is_verify":"1","device_type":"2","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"43.858737","user_longitude":"-79.065262","user_time_zone":"America/Toronto","device_version":"16.6.1|9.3|iPhone 11|EDT","schedule_id":"1709","team_name":"Knights","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","date":"2023-06-29","time":"10:30 PM","latitude":"43.829132","longitude":"-79.251633","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2023-06-29 22:30:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-06-29 23:30:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"284","phone_number":"4164192933","firstname":"Doug","lastname":"Knight","area_code":"L4A0V3","email":"knightdoug81@yahoo.com","password":"TXVzdGFyZDA5Kg==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"1","unpaid_game":"5","registered_on":"2023-03-11 01:11:59","is_verify":"1","device_type":"2","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"43.968172","user_longitude":"-79.222536","user_time_zone":"America/Toronto","device_version":"16.3.1|9.3|iPhone 12|EDT","schedule_id":"1633","team_name":"Mustards","rink":"Stouffville Clippers Sorts Complex","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","date":"2023-05-24","time":"07:00 PM","latitude":"43.96492","longitude":"-79.261856","game_duration":"60","address":"120 Weldon Rd, Whitchurch-Stouffville, ON L4A 1N2, Canada","game_datetime":"2023-05-24 19:00:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-05-24 20:00:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"182","phone_number":" 14169039836","firstname":"George","lastname":"Kostoulias","area_code":"M1R3S3","email":"gkostoulias@gmail.com","password":"U2xhbWR1bmsxIQ==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"11","unpaid_game":"5","registered_on":"2022-09-09 11:59:20","is_verify":"1","device_type":"1","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"43.693971","user_longitude":"-79.335831","user_time_zone":"","device_version":"14|4.4|SM-G990W|EST","schedule_id":"1500","team_name":"Bolts","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"1","save_game":"0","date":"2023-03-16","time":"01:00 AM","latitude":"43.8291323","longitude":"-79.2516358","game_duration":"60","address":"Canlan Sports, Dynamic Drive, Scarborough, ON, Canada","game_datetime":"2023-03-16 01:00:00","available_goalies":"1","history_goalies":"1","game_status":"completed","total_time":"2023-03-16 02:00:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"253","phone_number":"4164606666","firstname":"Brad","lastname":"Frizzell","area_code":"L1V3G7","email":"bradf1957@gmail.com","password":"QmFuZEIwNzI3Iw==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/63f621d6a7fce.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"1","unpaid_game":"5","registered_on":"2023-02-22 14:06:31","is_verify":"1","device_type":"2","device_token":"","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"30.185830","user_longitude":"-85.823545","user_time_zone":"","device_version":"16.6.1|9.3|iPhone 11|CDT","schedule_id":"1378","team_name":"Frizzell","rink":"Mount Joy","format":"Shinny - 5 vs 5","caliber":"B","goalies":"1","playoff":"0","save_game":"0","date":"2023-02-23","time":"09:00 PM","latitude":"43.891953","longitude":"-79.264069","game_duration":"60","address":"Mount Joy, Markham, ON L3P 7R2, Canada","game_datetime":"2023-02-23 21:00:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-02-23 22:00:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"1334","team_name":"Pylons","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","date":"2023-01-27","time":"02:00 AM","latitude":"43.829132","longitude":"-79.251633","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2023-01-27 02:00:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-01-27 03:00:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"1332","team_name":"Ale Stars","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","date":"2023-01-26","time":"02:45 AM","latitude":"43.829132","longitude":"-79.251633","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2023-01-26 02:45:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-01-26 03:45:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"1331","team_name":"The D","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","date":"2023-01-26","time":"02:00 AM","latitude":"43.829132","longitude":"-79.251636","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2023-01-26 02:00:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-01-26 03:00:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"1266","team_name":"Test","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"B","goalies":"1","playoff":"0","save_game":"0","date":"2023-01-09","time":"10:30 PM","latitude":"43.854061","longitude":"-78.878744","game_duration":"60","address":"1401 Phillip Murray Ave, Oshawa, ON L1J 8C4, Canada","game_datetime":"2023-01-09 22:30:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2023-01-09 23:30:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"1197","team_name":"BTA","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","date":"2022-12-21","time":"04:15 AM","latitude":"43.829132","longitude":"-79.251636","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2022-12-21 04:15:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2022-12-21 05:15:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"1120","team_name":"Real Classy Guysi","rink":"Canlan Sports","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"1","save_game":"0","date":"2022-04-13","time":"11:15 PM","latitude":"43.829132","longitude":"-79.251636","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2022-04-13 23:15:00","available_goalies":"1","history_goalies":"1","game_status":"completed","total_time":"2022-04-14 00:15:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"1118","team_name":"Beavers","rink":"Rinx Toronto","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","date":"2022-03-30","time":"02:15 AM","latitude":"43.71838","longitude":"-79.462364","game_duration":"60","address":"65 Orfus Rd, North York, ON M6A 1L7, Canada","game_datetime":"2022-03-30 02:15:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2022-03-30 03:15:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"852","team_name":"Ale Stars","rink":"Canlan Ice Sports","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","date":"2020-02-13","time":"03:30 AM","latitude":"43.829128","longitude":"-79.251518","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2020-02-13 03:30:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2020-02-13 04:30:00","cur_time":"2024-05-16 08:53:59"},{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"0.0","totalgame":"0","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"0","device_token":"empty","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"0.000000","user_longitude":"0.000000","user_time_zone":"","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"853","team_name":"White Hawks","rink":"Canlan Ice Sports","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","date":"2020-02-13","time":"12:15 AM","latitude":"43.829128","longitude":"-79.251518","game_duration":"60","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","game_datetime":"2020-02-13 00:15:00","available_goalies":"1","history_goalies":"0","game_status":"completed","total_time":"2020-02-13 01:15:00","cur_time":"2024-05-16 08:53:59"}]
/// success : "1"
/// message : "history "
/// service_time : "0.023047924041748 seconds"

GameHistoryModel gameHistoryModelFromJson(String str) =>
    GameHistoryModel.fromJson(json.decode(str));
String gameHistoryModelToJson(GameHistoryModel data) =>
    json.encode(data.toJson());

class GameHistoryModel {
  GameHistoryModel({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _serviceTime = serviceTime;
  }

  GameHistoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _success = json['success'];
    _message = json['message'];
    _serviceTime = json['service_time'];
  }
  List<Data>? _data;
  String? _success;
  String? _message;
  String? _serviceTime;
  GameHistoryModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      GameHistoryModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        serviceTime: serviceTime ?? _serviceTime,
      );
  List<Data>? get data => _data;
  String? get success => _success;
  String? get message => _message;
  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    map['message'] = _message;
    map['service_time'] = _serviceTime;
    return map;
  }
}

/// user_id : "182"
/// phone_number : " 14169039836"
/// firstname : "George"
/// lastname : "Kostoulias"
/// area_code : "M1R3S3"
/// email : "gkostoulias@gmail.com"
/// password : "U2xhbWR1bmsxIQ=="
/// user_type : "1"
/// gender : ""
/// calibre : ""
/// birthday : ""
/// avaliable_to_play : ""
/// kilometers_to_travel : ""
/// profile_pic : ""
/// level_of_game : ""
/// rent_a_goalie_experience : ""
/// rating : "5.0"
/// totalgame : "11"
/// unpaid_game : "5"
/// registered_on : "2022-09-09 11:59:20"
/// is_verify : "1"
/// device_type : "1"
/// device_token : ""
/// ashl_register : "0"
/// is_active : "1"
/// 60_min_game : "50"
/// 90_min_game : "65"
/// 120_min_game : "75"
/// goalie_cut : "0"
/// is_delete : "0"
/// is_approve : "1"
/// user_latitude : "43.693971"
/// user_longitude : "-79.335831"
/// user_time_zone : "America/Toronto"
/// device_version : "14|4.4|SM-G990W|EST"
/// schedule_id : "2236"
/// team_name : "Bolts"
/// rink : "Canlan Sports"
/// format : "Game - 5 vs 5"
/// caliber : "E"
/// goalies : "1"
/// playoff : "1"
/// save_game : "0"
/// date : "2024-03-13"
/// time : "09:30 PM"
/// latitude : "43.8291323"
/// longitude : "-79.2516358"
/// game_duration : "60"
/// address : "Canlan Sports, Dynamic Drive, Scarborough, ON, Canada"
/// game_datetime : "2024-03-13 21:30:00"
/// available_goalies : "1"
/// history_goalies : "1"
/// game_status : "completed"
/// total_time : "2024-03-13 22:30:00"
/// cur_time : "2024-05-16 08:53:59"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? userId,
    String? phoneNumber,
    String? firstname,
    String? lastname,
    String? areaCode,
    String? email,
    String? password,
    String? userType,
    String? gender,
    String? calibre,
    String? birthday,
    String? avaliableToPlay,
    String? kilometersToTravel,
    String? profilePic,
    String? levelOfGame,
    String? rentAGoalieExperience,
    String? rating,
    String? totalgame,
    String? unpaidGame,
    String? registeredOn,
    String? isVerify,
    String? deviceType,
    String? deviceToken,
    String? ashlRegister,
    String? isActive,
    String? MinGame60,
    String? MinGame90,
    String? MinGame120,
    String? goalieCut,
    String? isDelete,
    String? isApprove,
    String? userLatitude,
    String? userLongitude,
    String? userTimeZone,
    String? deviceVersion,
    String? scheduleId,
    String? teamName,
    String? rink,
    String? format,
    String? caliber,
    String? goalies,
    String? playoff,
    String? saveGame,
    String? date,
    String? time,
    String? latitude,
    String? longitude,
    String? gameDuration,
    String? address,
    String? gameDatetime,
    String? availableGoalies,
    String? historyGoalies,
    String? gameStatus,
    String? totalTime,
    String? curTime,
  }) {
    _userId = userId;
    _phoneNumber = phoneNumber;
    _firstname = firstname;
    _lastname = lastname;
    _areaCode = areaCode;
    _email = email;
    _password = password;
    _userType = userType;
    _gender = gender;
    _calibre = calibre;
    _birthday = birthday;
    _avaliableToPlay = avaliableToPlay;
    _kilometersToTravel = kilometersToTravel;
    _profilePic = profilePic;
    _levelOfGame = levelOfGame;
    _rentAGoalieExperience = rentAGoalieExperience;
    _rating = rating;
    _totalgame = totalgame;
    _unpaidGame = unpaidGame;
    _registeredOn = registeredOn;
    _isVerify = isVerify;
    _deviceType = deviceType;
    _deviceToken = deviceToken;
    _ashlRegister = ashlRegister;
    _isActive = isActive;
    _MinGame60 = MinGame60;
    _MinGame90 = MinGame90;
    _MinGame120 = MinGame120;
    _goalieCut = goalieCut;
    _isDelete = isDelete;
    _isApprove = isApprove;
    _userLatitude = userLatitude;
    _userLongitude = userLongitude;
    _userTimeZone = userTimeZone;
    _deviceVersion = deviceVersion;
    _scheduleId = scheduleId;
    _teamName = teamName;
    _rink = rink;
    _format = format;
    _caliber = caliber;
    _goalies = goalies;
    _playoff = playoff;
    _saveGame = saveGame;
    _date = date;
    _time = time;
    _latitude = latitude;
    _longitude = longitude;
    _gameDuration = gameDuration;
    _address = address;
    _gameDatetime = gameDatetime;
    _availableGoalies = availableGoalies;
    _historyGoalies = historyGoalies;
    _gameStatus = gameStatus;
    _totalTime = totalTime;
    _curTime = curTime;
  }

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _phoneNumber = json['phone_number'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _areaCode = json['area_code'];
    _email = json['email'];
    _password = json['password'];
    _userType = json['user_type'];
    _gender = json['gender'];
    _calibre = json['calibre'];
    _birthday = json['birthday'];
    _avaliableToPlay = json['avaliable_to_play'];
    _kilometersToTravel = json['kilometers_to_travel'];
    _profilePic = json['profile_pic'];
    _levelOfGame = json['level_of_game'];
    _rentAGoalieExperience = json['rent_a_goalie_experience'];
    _rating = json['rating'];
    _totalgame = json['totalgame'];
    _unpaidGame = json['unpaid_game'];
    _registeredOn = json['registered_on'];
    _isVerify = json['is_verify'];
    _deviceType = json['device_type'];
    _deviceToken = json['device_token'];
    _ashlRegister = json['ashl_register'];
    _isActive = json['is_active'];
    _MinGame60 = json['60_min_game'];
    _MinGame90 = json['90_min_game'];
    _MinGame120 = json['120_min_game'];
    _goalieCut = json['goalie_cut'];
    _isDelete = json['is_delete'];
    _isApprove = json['is_approve'];
    _userLatitude = json['user_latitude'];
    _userLongitude = json['user_longitude'];
    _userTimeZone = json['user_time_zone'];
    _deviceVersion = json['device_version'];
    _scheduleId = json['schedule_id'];
    _teamName = json['team_name'];
    _rink = json['rink'];
    _format = json['format'];
    _caliber = json['caliber'];
    _goalies = json['goalies'];
    _playoff = json['playoff'];
    _saveGame = json['save_game'];
    _date = json['date'];
    _time = json['time'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _gameDuration = json['game_duration'];
    _address = json['address'];
    _gameDatetime = json['game_datetime'];
    _availableGoalies = json['available_goalies'];
    _historyGoalies = json['history_goalies'];
    _gameStatus = json['game_status'];
    _totalTime = json['total_time'];
    _curTime = json['cur_time'];
  }
  String? _userId;
  String? _phoneNumber;
  String? _firstname;
  String? _lastname;
  String? _areaCode;
  String? _email;
  String? _password;
  String? _userType;
  String? _gender;
  String? _calibre;
  String? _birthday;
  String? _avaliableToPlay;
  String? _kilometersToTravel;
  String? _profilePic;
  String? _levelOfGame;
  String? _rentAGoalieExperience;
  String? _rating;
  String? _totalgame;
  String? _unpaidGame;
  String? _registeredOn;
  String? _isVerify;
  String? _deviceType;
  String? _deviceToken;
  String? _ashlRegister;
  String? _isActive;
  String? _MinGame60;
  String? _MinGame90;
  String? _MinGame120;
  String? _goalieCut;
  String? _isDelete;
  String? _isApprove;
  String? _userLatitude;
  String? _userLongitude;
  String? _userTimeZone;
  String? _deviceVersion;
  String? _scheduleId;
  String? _teamName;
  String? _rink;
  String? _format;
  String? _caliber;
  String? _goalies;
  String? _playoff;
  String? _saveGame;
  String? _date;
  String? _time;
  String? _latitude;
  String? _longitude;
  String? _gameDuration;
  String? _address;
  String? _gameDatetime;
  String? _availableGoalies;
  String? _historyGoalies;
  String? _gameStatus;
  String? _totalTime;
  String? _curTime;
  Data copyWith({
    String? userId,
    String? phoneNumber,
    String? firstname,
    String? lastname,
    String? areaCode,
    String? email,
    String? password,
    String? userType,
    String? gender,
    String? calibre,
    String? birthday,
    String? avaliableToPlay,
    String? kilometersToTravel,
    String? profilePic,
    String? levelOfGame,
    String? rentAGoalieExperience,
    String? rating,
    String? totalgame,
    String? unpaidGame,
    String? registeredOn,
    String? isVerify,
    String? deviceType,
    String? deviceToken,
    String? ashlRegister,
    String? isActive,
    String? MinGame60,
    String? MinGame90,
    String? MinGame120,
    String? goalieCut,
    String? isDelete,
    String? isApprove,
    String? userLatitude,
    String? userLongitude,
    String? userTimeZone,
    String? deviceVersion,
    String? scheduleId,
    String? teamName,
    String? rink,
    String? format,
    String? caliber,
    String? goalies,
    String? playoff,
    String? saveGame,
    String? date,
    String? time,
    String? latitude,
    String? longitude,
    String? gameDuration,
    String? address,
    String? gameDatetime,
    String? availableGoalies,
    String? historyGoalies,
    String? gameStatus,
    String? totalTime,
    String? curTime,
  }) =>
      Data(
        userId: userId ?? _userId,
        phoneNumber: phoneNumber ?? _phoneNumber,
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        areaCode: areaCode ?? _areaCode,
        email: email ?? _email,
        password: password ?? _password,
        userType: userType ?? _userType,
        gender: gender ?? _gender,
        calibre: calibre ?? _calibre,
        birthday: birthday ?? _birthday,
        avaliableToPlay: avaliableToPlay ?? _avaliableToPlay,
        kilometersToTravel: kilometersToTravel ?? _kilometersToTravel,
        profilePic: profilePic ?? _profilePic,
        levelOfGame: levelOfGame ?? _levelOfGame,
        rentAGoalieExperience: rentAGoalieExperience ?? _rentAGoalieExperience,
        rating: rating ?? _rating,
        totalgame: totalgame ?? _totalgame,
        unpaidGame: unpaidGame ?? _unpaidGame,
        registeredOn: registeredOn ?? _registeredOn,
        isVerify: isVerify ?? _isVerify,
        deviceType: deviceType ?? _deviceType,
        deviceToken: deviceToken ?? _deviceToken,
        ashlRegister: ashlRegister ?? _ashlRegister,
        isActive: isActive ?? _isActive,
        MinGame60: MinGame60 ?? _MinGame60,
        MinGame90: MinGame90 ?? _MinGame90,
        MinGame120: MinGame120 ?? _MinGame120,
        goalieCut: goalieCut ?? _goalieCut,
        isDelete: isDelete ?? _isDelete,
        isApprove: isApprove ?? _isApprove,
        userLatitude: userLatitude ?? _userLatitude,
        userLongitude: userLongitude ?? _userLongitude,
        userTimeZone: userTimeZone ?? _userTimeZone,
        deviceVersion: deviceVersion ?? _deviceVersion,
        scheduleId: scheduleId ?? _scheduleId,
        teamName: teamName ?? _teamName,
        rink: rink ?? _rink,
        format: format ?? _format,
        caliber: caliber ?? _caliber,
        goalies: goalies ?? _goalies,
        playoff: playoff ?? _playoff,
        saveGame: saveGame ?? _saveGame,
        date: date ?? _date,
        time: time ?? _time,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        gameDuration: gameDuration ?? _gameDuration,
        address: address ?? _address,
        gameDatetime: gameDatetime ?? _gameDatetime,
        availableGoalies: availableGoalies ?? _availableGoalies,
        historyGoalies: historyGoalies ?? _historyGoalies,
        gameStatus: gameStatus ?? _gameStatus,
        totalTime: totalTime ?? _totalTime,
        curTime: curTime ?? _curTime,
      );
  String? get userId => _userId;
  String? get phoneNumber => _phoneNumber;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get areaCode => _areaCode;
  String? get email => _email;
  String? get password => _password;
  String? get userType => _userType;
  String? get gender => _gender;
  String? get calibre => _calibre;
  String? get birthday => _birthday;
  String? get avaliableToPlay => _avaliableToPlay;
  String? get kilometersToTravel => _kilometersToTravel;
  String? get profilePic => _profilePic;
  String? get levelOfGame => _levelOfGame;
  String? get rentAGoalieExperience => _rentAGoalieExperience;
  String? get rating => _rating;
  String? get totalgame => _totalgame;
  String? get unpaidGame => _unpaidGame;
  String? get registeredOn => _registeredOn;
  String? get isVerify => _isVerify;
  String? get deviceType => _deviceType;
  String? get deviceToken => _deviceToken;
  String? get ashlRegister => _ashlRegister;
  String? get isActive => _isActive;
  String? get MinGame60 => _MinGame60;
  String? get MinGame90 => _MinGame90;
  String? get MinGame120 => _MinGame120;
  String? get goalieCut => _goalieCut;
  String? get isDelete => _isDelete;
  String? get isApprove => _isApprove;
  String? get userLatitude => _userLatitude;
  String? get userLongitude => _userLongitude;
  String? get userTimeZone => _userTimeZone;
  String? get deviceVersion => _deviceVersion;
  String? get scheduleId => _scheduleId;
  String? get teamName => _teamName;
  String? get rink => _rink;
  String? get format => _format;
  String? get caliber => _caliber;
  String? get goalies => _goalies;
  String? get playoff => _playoff;
  String? get saveGame => _saveGame;
  String? get date => _date;
  String? get time => _time;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get gameDuration => _gameDuration;
  String? get address => _address;
  String? get gameDatetime => _gameDatetime;
  String? get availableGoalies => _availableGoalies;
  String? get historyGoalies => _historyGoalies;
  String? get gameStatus => _gameStatus;
  String? get totalTime => _totalTime;
  String? get curTime => _curTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['phone_number'] = _phoneNumber;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['area_code'] = _areaCode;
    map['email'] = _email;
    map['password'] = _password;
    map['user_type'] = _userType;
    map['gender'] = _gender;
    map['calibre'] = _calibre;
    map['birthday'] = _birthday;
    map['avaliable_to_play'] = _avaliableToPlay;
    map['kilometers_to_travel'] = _kilometersToTravel;
    map['profile_pic'] = _profilePic;
    map['level_of_game'] = _levelOfGame;
    map['rent_a_goalie_experience'] = _rentAGoalieExperience;
    map['rating'] = _rating;
    map['totalgame'] = _totalgame;
    map['unpaid_game'] = _unpaidGame;
    map['registered_on'] = _registeredOn;
    map['is_verify'] = _isVerify;
    map['device_type'] = _deviceType;
    map['device_token'] = _deviceToken;
    map['ashl_register'] = _ashlRegister;
    map['is_active'] = _isActive;
    map['60_min_game'] = _MinGame60;
    map['90_min_game'] = _MinGame90;
    map['120_min_game'] = _MinGame120;
    map['goalie_cut'] = _goalieCut;
    map['is_delete'] = _isDelete;
    map['is_approve'] = _isApprove;
    map['user_latitude'] = _userLatitude;
    map['user_longitude'] = _userLongitude;
    map['user_time_zone'] = _userTimeZone;
    map['device_version'] = _deviceVersion;
    map['schedule_id'] = _scheduleId;
    map['team_name'] = _teamName;
    map['rink'] = _rink;
    map['format'] = _format;
    map['caliber'] = _caliber;
    map['goalies'] = _goalies;
    map['playoff'] = _playoff;
    map['save_game'] = _saveGame;
    map['date'] = _date;
    map['time'] = _time;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['game_duration'] = _gameDuration;
    map['address'] = _address;
    map['game_datetime'] = _gameDatetime;
    map['available_goalies'] = _availableGoalies;
    map['history_goalies'] = _historyGoalies;
    map['game_status'] = _gameStatus;
    map['total_time'] = _totalTime;
    map['cur_time'] = _curTime;
    return map;
  }
}
