	parameter (n=20)
	
	character aa(n)*1
	real prob(n), probmulti(n,n)

	open(1,file="individual-occur-prob-file")
	open(2,file="multi-individual-prob-file")

	do i=1,n
	read(1,"(a1,18x,f7.3)") aa(i),prob(i)
	enddo

	do i=1,n
	do j=1,n

	probmulti(i,j)=prob(i)*prob(j)

	write(2,"(a1,a1,5x,f8.6)") aa(i),aa(j), probmulti(i,j)

	enddo
	enddo

	stop
	end
