	parameter (n=400)
	character aa(n)*2
	real mulprob(n),actprob(n)

	open(1,file="multi-individual-prob-file")
	open(2,file="actual-pair-probability-file-new")
	open(3,file="multi-indi-prob-and-actual-pair-prob-file-new")

	do i=1,n
	read(1,"(a2,5x,f8.6)") aa(i),mulprob(i)
	enddo

	do i=1,n
	read(2,"(19x,f8.6)") actprob(i)
	enddo

	do i=1,n
	write(3,"(a2,5x,f8.6,5x,f8.6)") aa(i),mulprob(i),actprob(i)
	enddo

	stop
	end
