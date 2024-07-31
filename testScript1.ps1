$cars = @('Bmw', 'Honda', 'Mercedes', 'Suzuki') 

foreach($car in $cars){
    $car
}
echo ""
echo ""
$cars | foreach {$_.Length}

#$cars | Get-Member

