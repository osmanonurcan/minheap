	area hArray,data,readwrite
	
heapArray DCD 0,0,0,0,0,0
	
	
	area minheap,code,readonly
	entry
	
	;init
	ldr sp,=0x30000000
	ldr r4,=list
	ldr r5,=heapArray
	bl findArrayLenght
	mov r6,r0
	bl buildHeap
    b son
	
findArrayLenght ;findArrayLenght(list)
	mov r0,r4 ;list
	mov r1,#0 ;sayac
loop
	ldr r2,[r0],#4
	cmp r2,#-1
	beq end1
	add r1,r1,#1
	b loop
end1
	mov r0,r1
	bx lr 
	
buildHeap ;buildHeap(list,heapArray)
	mov r0,r4 ;list
	mov r1,r5 ;heapArray
	mov r2,r6 ;list lenght
	str r6,[r1],#4 ;heapArray[0]=size
loop1 ;heapArray = list 
	cmp r2,#0
	beq end2
	ldr r3,[r0],#4
	str r3,[r1],#4
	sub r2,r2,#1
	b loop1
end2

	mov r3,r6,lsr#1 ;size/2
	;sub r3,r3,#1 ;i=size/2-1
loop2
	cmp r3,#1
	blt end3
	push {lr}
	bl minHeapify
	
	sub r3,r3,#1
	b loop2
end3
	pop {lr}
	bx lr

minHeapify ;minHeapify(list,r6=size,r3=i)
	
	mov r0,r3 ;smallest
	mov r1,#2
	mul r2,r0,r1
	
	mov r10,r2 ;left (2k)
	
	add r4,r10,#1 ;right(2k+1)

	
	cmp r10,r6
	bge noproc1
	mov r7,r10,lsl#2
	ldr r8,[r5,r7] ;heapArray[left]
	mov r7,r0,lsl#2
	ldr r9,[r5,r7] ;heapArray[smallest]
	cmp r8,r9
	bgt noproc1
	mov r0,r10 ;smallest = left
noproc1	
	cmp r4,r6
	bge noproc2
	mov r7,r4,lsl#2
	ldr r8,[r5,r7] ;heapArray[right]
	mov r7,r0,lsl#2
	ldr r9,[r5,r7] ;heapArray[smallest]
	cmp r8,r9
	bgt noproc2
	mov r0,r4 ;smallest = right
noproc2
	cmp r0,r3
	beq end4
	mov r7,r3,lsl#2
	ldr r8,[r5,r7] ;heapArray[i]
	str r9,[r5,r7] ;heapArray[i]=heapArray[smallest]
	mov r11,r0,lsl#2
	str r8,[r5,r11] ;heapArray[smallest]=heapArray[i]
	push {lr}
	bl minHeapify
	
end4
	pop {lr}
	bx lr
	
son
	
list DCD  5,4,6,2,9,-1

	
	end