	parameter(nm=10,na=20,nbin=200)
	
	character filename(na,nm)*15,potfile(na,nm)*11
	character nndistfilesav(nm)*20
	
	real av(nbin),nn(nbin),pot(nbin)
	
	open(1,file="file-list")
	open(2,file="potential-all-aa-files")
	open(3,file="nndistfile-av")
	
	do i=1,na
	do j=1,nm
	
	read(1,"(a15)") filename(i,j)
	read(2,"(a11)") potfile(i,j)
	
	enddo
	enddo
	
c	write(*,"(a15)") filename(1,1),filename(2,1)
c	write(*,"(a11)") potfile(1,1),potfile(2,1)
	
	do i=1,nm
	read(3,"(a20)") nndistfilesav(i)
	
	write(*,"(a20)") nndistfilesav(i)
	enddo
	
	do i=1,na
	do j=1,nm
	
	open(7,file="bin-nn-distance-all-aa/"//filename(i,j))
	do k=1,nbin
	read(7,"(F12.8)") nn(k) 
	enddo

	open(8,file=nndistfilesav(j))
	do kk=1,nbin
	read(8,"(F12.8)") av(kk)
	enddo
	
	do kkk=1,nbin
	pot(kkk)=(-LOG(nn(kkk)/av(kkk)))*nn(kkk)
	enddo
	
	open(9,file="pot-all-aa-test/"//potfile(i,j))
	do k=1,nbin
	write(9,"(F12.8)") pot(k)
	enddo
	
	enddo
	enddo	
	
	stop
	end
