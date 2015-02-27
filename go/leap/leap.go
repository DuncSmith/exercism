package leap

const TestVersion = 1

func IsLeapYear(year int) bool {
	return (multiple(4, year) && !multiple(100, year)) || multiple(400, year)
}

func multiple(divisor int, year int) bool {
	return year%divisor == 0
}
