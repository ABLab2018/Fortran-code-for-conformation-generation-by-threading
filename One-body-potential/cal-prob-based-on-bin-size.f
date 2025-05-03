	parameter(nres=7837,nf=10,nbin=200)
	
	character filename(nf)*7,binfilename(nf)*15
	character bindexfile(nf)*17,potfile(nf)*11,bincountfilename(nf)*17
	real distance(nres),sum1,bin_count(nf,nbin),pot(nbin)
	integer bin_index
	
	bin_count=0
	bin_size=0.2
	
	open(1,file="file-name-ALA")
	open(3,file="binning-filename")
	open(8,file="bin-index-filename")
	open(9,file="binning-ALA-file/bin-number")
	open(10,file="potential-ALA-files")
	open(13,file="bin-count-filename")
	
	do i=1,nf
	read(1,"(a7)") filename(i)
c	write(*,*) filename(i)
	read(3,"(a15)") binfilename(i)
	read(8,"(a17)") bindexfile(i)
	read(10,"(a11)") potfile(i)
	read(13,"(a17)") bincountfilename(i)
c	write(*,*) filename(i)
	enddo
	
c	Read and distribute data into bins	

	do i=1,nf
	open(2,file="nn-calpha-dist-cal/"//filename(i))
	open(7,file="bin-index-files/"//bindexfile(i))
C	write(*,*) filename(i)
	
	do j=1,nres
	read(2,*) distance(j)
	enddo
	
	do j=1,nres
	
	bin_index = int(distance(j)/bin_size) + 1
   	bin_count(i,bin_index)= bin_count(i,bin_index) + 1
   	   	
	write(7,*) bin_index
	enddo
	
c	 Display bin counts
		
	open(14,file="binning-ALA-file/"//binfilename(i))
	open(11,file="binning-ALA-file/"//potfile(i))
	
	do k = 1, nbin
	write(14,"(F12.8)") bin_count(i,k)/nres
		
	pot(k)=-LOG(bin_count(i,k)/nres)
	
	write(11,"(F12.8)") pot(k)
	end do
	
	open(12,file="binning-ALA-file/"//bincountfilename(i))
	
	do k=1,nbin
	write(12,*) bin_count(i,k)
	enddo
	
	write(*,*) MAXVAL(distance)
	enddo
	
	do k=1,nbin
	write(9,"(I3)") k
	enddo
	
	stop
	end
