<?php

$f3 = require('./lib/fatfree-core-master/base.php');
require './connect.php';

require './subject_service.php';
require '../repository/subject_repository.php';

require './activity_service.php';
require '../repository/activity_repository.php';

require './class_service.php';
require '../repository/class_repository.php';

require './role_service.php';
require '../repository/role_repository.php';

require './permission_service.php';
require '../repository/permission_repository.php';

require './room_service.php';
require '../repository/room_repository.php';

require './dayoff_service.php';
require '../repository/dayoff_repository.php';

require './user_service.php';
require '../repository/user_repository.php';

require './booking_service.php';
require '../repository/booking_repository.php';

require './recurrence_service.php';
require '../repository/recurrence_repository.php';

require './credential_service.php';
require '../repository/credential_repository.php';

/* $f3->set('CORS.origin','*'); */

$f3->route('OPTIONS /*', function($f3) {
    header('Access-Control-Allow-Origin: *');     
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
});

$f3->map('/subjects/@id','SubjectService');
$f3->map('/subjects','SubjectService');
$f3->route('GET /subjects/user/@userId','SubjectService->getSubjectsByUser');

$f3->map('/activities/@id','ActivityService');
$f3->map('/activities','ActivityService');

$f3->map('/classes/@id','ClassService');
$f3->map('/classes','ClassService');
$f3->route('GET /classes/search/@filter','ClassService->search');

$f3->map('/roles/@id','RoleService');
$f3->map('/roles','RoleService');

$f3->map('/permissions/@id','PermissionService');
$f3->map('/permissions','PermissionService');

$f3->map('/rooms/@id','RoomService');
$f3->map('/rooms','RoomService');
$f3->route('GET /rooms/room/@code','RoomService->getByCode');

$f3->map('/daysoff/@id','DayOffService');
$f3->map('/daysoff','DayOffService');

$f3->map('/users/@id','UserService');
$f3->map('/users','UserService');
$f3->route('GET /users/user/@email','UserService->getByEmail');
$f3->route('GET /users/search/@type/@filter','UserService->search');

$f3->map('/bookings/@id','BookingService');
$f3->map('/bookings','BookingService');
$f3->route('POST /timetables','BookingService->postView');
$f3->route('POST /bookings/users','BookingService->postUserBooking');
$f3->route('GET /bookings/users/@userId','BookingService->getBookingsByUser');
$f3->route('DELETE /bookings/users/@id','BookingService->deleteUserBooking');
$f3->route('GET /bookings/student/@userId/@currentDate','BookingService->getByStudent');
$f3->route('GET /bookings/teacher/@userId/@currentDate','BookingService->getByTeacher');
$f3->route('GET /bookings/class/@classId/@currentDate','BookingService->getByClass');

$f3->map('/recurrences/@id','RecurrenceService');
$f3->map('/recurrences','RecurrenceService');

$f3->map('/credentials/@id','CredentialService');
$f3->map('/credentials','CredentialService');
$f3->route('GET /credentials/credential/@username','CredentialService->getByUsername');
$f3->route('POST /login','CredentialService->login');
$f3->route('POST /registration','CredentialService->registration');

$f3->run();