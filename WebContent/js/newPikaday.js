new Pikaday(
{
field: document.getElementById('datepicker'),
trigger: document.getElementById('datepicker-button'),
minDate: new Date(2000, 0, 1),
ariaLabel: 'Custom label',
maxDate: new Date(2050, 12, 31),      
yearRange: [2000,2050]
}
);