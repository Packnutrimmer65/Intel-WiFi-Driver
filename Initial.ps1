$employees = @(
    [PSCustomObject]@{
        Name = "Alice"
        Department = "Engineering"
        Salary = 6200
    }
    [PSCustomObject]@{
        Name = "Brian"
        Department = "Marketing"
        Salary = 4700.50
    }
    [PSCustomObject]@{
        Name = "Clara"
        Department = "Design"
        Salary = 5300.75
    }
    [PSCustomObject]@{
        Name = "David"
        Department = "Finance"
        Salary = 5800.25
    }
)

$sortedEmployees = $employees | Sort-Object Salary -Descending
$totalSalary = ($employees | Measure-Object Salary -Sum).Sum
$averageSalary = $totalSalary / $employees.Count

Write-Host "Payroll Report"
Write-Host "=============="

foreach ($employee in $sortedEmployees) {
    Write-Host "$($employee.Name) | $($employee.Department) | `$$("{0:N2}" -f $employee.Salary)"
}

Write-Host "=============="
Write-Host "Employees: $($employees.Count)"
Write-Host "Total Salary: `$$("{0:N2}" -f $totalSalary)"
Write-Host "Average Salary: `$$("{0:N2}" -f $averageSalary)"
Write-Host "Highest Paid: $($sortedEmployees[0].Name)"