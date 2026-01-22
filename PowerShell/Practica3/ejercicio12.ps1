#Ejercicio 12: Pizzería Bella Napoli
$tipo = Read-Host "¿Quieres pizza vegetariana? (S/N)"
$ingredientes = "Tomate, Mozzarella"

if ($tipo -eq "S") {
    $extra = Read-Host "Elige: Pimiento o Tofu"
    Write-Host "Pizza Vegetariana. Ingredientes: $ingredientes, $extra"
} else {
    $extra = Read-Host "Elige: Peperoni, Jamón o Salmón"
    Write-Host "Pizza No Vegetariana. Ingredientes: $ingredientes, $extra"
}
