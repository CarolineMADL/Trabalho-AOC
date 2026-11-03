.data
msg_i:.asciiz "Digite o valor de n (deve ser maior que 2 e menor que 40):"
msg_erro:.asciiz"Valor Invalido! Tente novamente \n"
msg_res:.asciiz "A soma dos n numeros fibonacci é : "
.text
main:
entrada:
li $v0, 4
la $a0 , msg_i
syscall

li $v0,5
syscall
move $t0,$v0

ble $t0,2,invalida

bge $t0,40,invalida

j cal_fib

invalida:
li $v0,4
la $a0,msg_erro
syscall
j entrada
  
 
cal_fib:
li $t1, 0
li $t2, 1
li $t3, 1
li $t4, 2

loop:
beq $t4,$t0,resultado
add $t5, $t1, $t2
add $t3,$t3,$t5
move $t1,$t2
move $t2,$t5
addi $t4,$t4,1
j loop

resultado:
li $v0,4
la $a0, msg_res
syscall

li $v0,1
move $a0,$t3
syscall

li $v0,10
syscall
