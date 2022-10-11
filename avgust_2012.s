#Napisati rekurzivnu MIPS funkciju avg2012 koja ima jedan pozitivan cjelobrojni argument a i koja 
#izračunava i vraća zbir kvadrata neparnih cifara  broja a.

.text 

avg2012:
    addi $sp, $sp, -12
    sw $ra, 0($sp)

    beqz $a0, bazni_slucaj

    rem $t0, $a0, 10
    div $a0, $a0, 10

    sw $t0, 4($sp)
    sw $a0, 8($sp)
    jal avg2012

    lw $t1, 4($sp)
    rem $t2, $t1, 2
    beqz $t2, kraj_rekurzije
    mulo $t3, $t1, $t1
    add $v0, $v0, $t3
    j kraj_rekurzije
bazni_slucaj:
    li $v0, 0
kraj_rekurzije:
    lw $ra, 0($sp)
    addi $sp, $sp, 12
    jr $ra 

main:

    la $a0, unos_a
    li $v0, 4
    syscall

    li $v0, 5
    syscall

    move $a0, $v0 
    jal avg2012 

    move $a0, $v0 
    li $v0, 1
    syscall

    li $v0, 10
    syscall

.data 
    unos_a: .asciiz "Unesi a: "