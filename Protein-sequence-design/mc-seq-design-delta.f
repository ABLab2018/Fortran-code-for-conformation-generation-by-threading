	parameter(mcseq=500,mcstep=5000,npro=19537,nupro=19536)
	parameter(nsite=50,na=20,nf=10,nbin=200,np=315566,np1=1145226)
	parameter(np2=1014468,np3=788236,np4=1694974,np5=2084332)
	parameter(np6=2409134,np7=1982944,np8=2273016)
	parameter(np9=2301764,np10=2351126)
	
	real cc,cc1,cc2,eold(npro,nsite),eold1,transp,random,kT
	double precision eunnew,eun
	integer seq,ssite,site,aseq(nsite),aseqn(nsite),arand
	real oneold,oneold1,oneold2(npro,nsite),en,en1,enew2,eold2
	real onenew,onenew1,onenew2(npro,nsite),eavunnew
	real told,told1,told2(npro,nsite),eavun,delold,delold1
	real told3,told11,told22(npro,nsite)
	real told4,told31,told32(npro,nsite)
	real told5,told51,told52(npro,nsite)
	real told6,told61,told62(npro,nsite)
	real told7,told71,told72(npro,nsite)
	real told8,told81,told82(npro,nsite)
	real told9,told91,told92(npro,nsite),told10,told101
	real told13,told131,told132(npro,nsite)
	real told12,told121,told122(npro,nsite)
	real delnew,enew(npro,nsite)
	real tnew4,tnew31,tnew32(npro,nsite),told102(npro,nsite)
	real tnew5,tnew51,tnew52(npro,nsite)
	real tnew6,tnew61,tnew62(npro,nsite)
	real tnew7,tnew71,tnew72(npro,nsite)
	real tnew8,tnew81,tnew82(npro,nsite)
	real tnew9,tnew91,tnew92(npro,nsite)
	real tnew10,tnew101,tnew102(npro,nsite)
	real tnew13,tnew131,tnew132(npro,nsite)
	real tnew12,tnew121,tnew122(npro,nsite)
	real tnew,tnew1,tnew2(npro,nsite)
	real tnew3,tnew11,tnew22(npro,nsite)
	integer bin_index(npro,nf,nsite),c(np),s1(np),s2(np)
	integer c1(np),c2(np1),c3(np2),c4(np3),c5(np4),c6(np5),c7(np6)
	integer c8(np7),c9(np8),c10(np9),c11(np10),ss1(np1),ss2(np1)
	integer s3s1(np2),s3s2(np2)
	integer s4s1(np3),s4s2(np3),s5s1(np4),s5s2(np4)
	integer s6s1(np5),s6s2(np5),s7s1(np6),s7s2(np6)
	integer s8s1(np7),s8s2(np7),s9s1(np8),s9s2(np8)
	integer s10s1(np9),s10s2(np9),s11s1(np10),s11s2(np10)
	real tpot2(na,na),tpot3(na,na),tpot4(na,na),tpot5(na,na)
	real tpot6(na,na),tpot7(na,na),tpot8(na,na),tpot9(na,na)
	real tpot10(na,na),tpot11(na,na)
	real onepot(na,nf,nbin),tpot(na,na),two,two1,one
	character string1*12,string2*5
	
	kT=0.04
	
	open(1,file="bin-index-upto-nn10")
	open(2,file="one-body-potential-nn10-modified")
	open(7,file="contact-profile-all-lt-5")
	open(3,file="new-potential-file-CA-0-5-modified")	
	open(8,file="contact-profile-all-5-6")
	open(9,file="new-potential-file-CA-5-6-modified")
	open(15,file="contact-profile-all-6-7")
	open(16,file="new-potential-file-CA-6-7-modified")
	open(17,file="contact-profile-all-7-8")
	open(18,file="new-potential-file-CA-7-8-modified")
	open(19,file="contact-profile-all-8-9")
	open(20,file="new-potential-file-CA-8-9-modified")
	open(21,file="contact-profile-all-9-10")
	open(22,file="new-potential-file-CA-9-10-modified")
	open(23,file="contact-profile-all-10-11")
	open(24,file="new-potential-file-CA-10-11-modified")
	open(25,file="contact-profile-all-11-12")
	open(26,file="new-potential-file-CA-11-12-modified")
	open(27,file="contact-profile-all-12-13")
	open(28,file="new-potential-file-CA-12-13-modified")
	open(29,file="contact-profile-all-13-14")
	open(30,file="new-potential-file-CA-13-14-modified")
	open(31,file="contact-profile-all-14-15")
	open(32,file="new-potential-file-CA-14-15-modified")
	
	do i=1,npro
	do j=1,nf
	do k=1,nsite
	read(1,*) bin_index(i,j,k)
c	write(*,*) bin_index(i,j,k)
	enddo
	enddo
	enddo

c*********read-one-body-potentials-nearest neighbour****************
	do i=1,na
	do j=1,nf
	do k=1,nbin
	read(2,*) onepot(i,j,k)
	enddo
	enddo
	enddo
c***********************read-two-body-potential*************************
	do i=1,na
	do j=1,na
	read(3,"(31x,f11.6)") tpot(i,j)
	read(9,"(31x,f11.6)") tpot2(i,j)
	read(16,"(31x,f11.6)") tpot3(i,j)
	read(18,"(31x,f11.6)") tpot4(i,j)
	read(20,"(31x,f11.6)") tpot5(i,j)
	read(22,"(31x,f11.6)") tpot6(i,j)
	read(24,"(31x,f11.6)") tpot7(i,j)
	read(26,"(31x,f11.6)") tpot8(i,j)
	read(28,"(31x,f11.6)") tpot9(i,j)
	read(30,"(31x,f11.6)") tpot10(i,j)
	read(32,"(31x,f11.6)") tpot11(i,j)
	enddo
	enddo
c*******************read-contact-file******************************
	do i=1,np
	read(7,*) c1(i),s1(i),s2(i)
c	write(*,*)c1(i),s1(i),s2(i)
	enddo
	do i=1,np1
	read(8,*) c2(i),ss1(i),ss2(i)
	enddo
	do i=1,np2
	read(15,*) c3(i),s3s1(i),s3s2(i)
	enddo
	do i=1,np3
	read(17,*) c4(i),s4s1(i),s4s2(i)
	enddo
	do i=1,np4
	read(19,*) c5(i),s5s1(i),s5s2(i)
	enddo
	do i=1,np5
	read(21,*) c6(i),s6s1(i),s6s2(i)
	enddo
	do i=1,np6
	read(23,*) c7(i),s7s1(i),s7s2(i)
	enddo
	do i=1,np7
	read(25,*) c8(i),s8s1(i),s8s2(i)
	enddo
	do i=1,np8
	read(27,*) c9(i),s9s1(i),s9s2(i)
	enddo
	do i=1,np9
	read(29,*) c10(i),s10s1(i),s10s2(i)
	enddo
	do i=1,np10
	read(31,*) c11(i),s11s1(i),s11s2(i)
	enddo

c*********************random sequence generation**************************
	id=-2
	
	do k=1,mcseq
	
	write(string2,"(I5)") k
	
	do i=1,nsite
	cc=ran1(id)
	seq=int(cc*20)+1
	aseq(i)=seq
	enddo
c	do i=1,nsite
c	write(*,*)aseq(i)
c	enddo
c****************************energy calculation********************************
c**two-body*Calpha-lt-5***take contact sites and their corresponding aa potential*********
	told=0
	do j=1,np
	if(c1(j) .ne. c1(j-1).or.s1(j) .ne. s1(j-1)) then
	told=0
	endif
	
	told1=tpot(aseq(s1(j)),aseq(s2(j)))
	
	told2(c1(j),s1(j))= told + told1
	
	told= told2(c1(j),s1(j))	
	enddo
c******Calpha-5-6****two-body-potential*********************************
	told3=0
	do j=1,np1
	
	if(c2(j) .ne. c2(j-1).or.ss1(j).ne.ss1(j-1)) then
	told3=0
	endif
	
	told11=tpot2(aseq(ss1(j)),aseq(ss2(j)))
	
	told22(c2(j),ss1(j))= told3 + told11
	
	told3= told22(c2(j),ss1(j))	
	enddo
c******Calpha-6-7****two-body-potential*********************************
	told4=0
	do j=1,np2
	
	if(c3(j) .ne. c3(j-1).or. s3s1(j).ne. s3s1(j-1)) then
	told4=0
	endif
	
	told31=tpot3(aseq(s3s1(j)),aseq(s3s2(j)))
	
	told32(c3(j),s3s1(j))= told4 + told31
	
	told4= told32(c3(j),s3s1(j))
	enddo
c******Calpha-7-8****two-body-potential*********************************
	told5=0
	do j=1,np3
	
	if(c4(j) .ne. c4(j-1).or. s4s1(j).ne.s4s1(j-1)) then
	told5=0
	endif
	
	told51=tpot4(aseq(s4s1(j)),aseq(s4s2(j)))
	
	told52(c4(j),s4s1(j))= told5 + told51
	
	told5= told52(c4(j),s4s1(j))	
	enddo
c******Calpha-8-9****two-body-potential*********************************
	told6=0
	do j=1,np4
	
	if(c5(j) .ne. c5(j-1).or.s5s1(j).ne.s5s1(j-1)) then
	told6=0
	endif
	
	told61=tpot5(aseq(s5s1(j)),aseq(s5s2(j)))
	
	told62(c5(j),s5s1(j))= told6 + told61
	
	told6= told62(c5(j),s5s1(j))	
	enddo
c******Calpha-9-10****two-body-potential*********************************
	told7=0
	do j=1,np5
	
	if(c6(j) .ne. c6(j-1).or.s6s1(j).ne.s6s1(j-1)) then
	told7=0
	endif
	
	told71=tpot6(aseq(s6s1(j)),aseq(s6s2(j)))
	
	told72(c6(j),s6s1(j))= told7 + told71
	
	told7= told72(c6(j),s6s1(j))	
	enddo
c******Calpha-10-11****two-body-potential*********************************
	told8=0
	do j=1,np6
	
	if(c7(j) .ne. c7(j-1).or. s7s1(j) .ne.s7s1(j-1)) then
	told8=0
	endif
	
	told81=tpot7(aseq(s7s1(j)),aseq(s7s2(j)))
	
	told82(c7(j),s7s1(j))= told8 + told81
	
	told8= told82(c7(j),s7s1(j))	
	enddo
c******Calpha-11-12****two-body-potential*********************************
	told9=0
	do j=1,np7
	
	if(c8(j) .ne. c8(j-1).or.s8s1(j).ne.s8s1(j-1)) then
	told9=0
	endif
	
	told91=tpot8(aseq(s8s1(j)),aseq(s8s2(j)))
	
	told92(c8(j),s8s1(j))= told9 + told91
	
	told9= told92(c8(j),s8s1(j))	
	enddo
c******Calpha-12-13****two-body-potential*********************************
	told10=0
	do j=1,np8
	
	if(c9(j) .ne. c9(j-1).or.s9s1(j).ne. s9s1(j-1)) then
	told10=0
	endif
	
	told101=tpot9(aseq(s9s1(j)),aseq(s9s2(j)))
	
	told102(c9(j),s9s1(j))= told10 + told101
	
	told10= told102(c9(j),s9s1(j))	
	enddo
c******Calpha-13-14****two-body-potential*********************************
	told13=0
	do j=1,np9
	
	if(c10(j) .ne. c10(j-1).or. s10s1(j).ne.s10s1(j-1)) then
	told13=0
	endif
	
	told131=tpot10(aseq(s10s1(j)),aseq(s10s2(j)))
	
	told132(c10(j),s10s1(j))= told13 + told131
	
	told13= told132(c10(j),s10s1(j))	
	enddo
c******Calpha-14-15****two-body-potential*********************************
	told12=0
	do j=1,np10
	
	if(c11(j) .ne. c11(j-1).or. s11s1(j).ne. s11s1(j-1)) then
	told12=0
	endif
	
	told121=tpot11(aseq(s11s1(j)),aseq(s11s2(j)))
	
	told122(c11(j),s11s1(j))= told12 + told121
	
	told12= told122(c11(j),s11s1(j))	
	enddo
c******onebody-nearest-number-dependent-upto-nn10*****************************
	do i=1,npro
	do j=1,nsite
	if(i .ne. i-1) then
	oneold=0
	endif
	do k1=1,nf
	
	oneold1=onepot(aseq(j),k1,bin_index(i,k1,j))     	
     	oneold2(i,j)=oneold + oneold1
     	
     	oneold=oneold2(i,j)
	enddo
	enddo
	enddo
c	do j=1,nsite
c	write(*,*) oneold2(1,j)
c	enddo
c**********************************add-old-energy******************************	
	eold2=0
	do i=1,npro
	do j=1,nsite	
	eold(i,j)= eold2+told2(i,j)+told22(i,j)+told32(i,j)
     $  +told52(i,j)+told62(i,j)+told72(i,j)+told82(i,j)+told92(i,j)
     $  +told102(i,j)+told132(i,j)+told122(i,j)+oneold2(i,j)
	enddo
	enddo
	
	en=0
	do j=1,nsite
	en=en+eold(1,j)
	enddo
	
	eun=0
	do i=2,npro
	do j=1,nsite
	eun=eun + eold(i,j)
	enddo
	enddo

	eavun=eun/nupro
	
	delold= en-eavun
c	write(*,*) en,eavun,eun,nupro,delold	
c******************************random site selection************************
	do l=1,mcstep
		
	cc1=ran1(id)
	site=int(cc1*nsite)+1
	ssite=site
c	write(*,*) ssite

c*********save old seq as a new sequence*******************************
	do i=1,nsite
	aseqn(i)=aseq(i)
c	write(*,*) aseqn(i),aseq(i)
	enddo
c**********************random amino acid selection at selected site**************
	cc2=ran1(id)
	arand=int(cc2*20)+1
c	write(*,*) arand
	
	aseqn(ssite)=arand

c	do i=1,nsite
c	write (*,*) aseqn(i),aseq(i)
c	enddo
c*********************save old sequence energy*****************************
	delold1=delold
c	write(*,*) delold1,delold
c*************************calculate energy of new sequence*****************
c********two-body-pot*****Calpha-lt-5**************
	tnew=0
	do j=1,np
	if(c1(j).ne.c1(j-1).or.s1(j).ne.s1(j-1)) then
	tnew=0
	endif
	
	tnew1=tpot(aseqn(s1(j)),aseqn(s2(j)))
	
	tnew2(c1(j),s1(j))= tnew + tnew1
	
	tnew= tnew2(c1(j),s1(j))	
	enddo
c	do j=1,nsite
c	write(*,*) tnew2(1,j)
c	enddo
c****************Calpha-5-6******two-body-pot*********
	tnew3=0
	do j=1,np1
	
	if(c2(j) .ne. c2(j-1).or.ss1(j).ne.ss1(j-1)) then
	tnew3=0
	endif

	tnew11=tpot2(aseqn(ss1(j)),aseqn(ss2(j)))
	
	tnew22(c2(j),ss1(j))= tnew3 + tnew11
	
	tnew3= tnew22(c2(j),ss1(j))	
	enddo
c	do j=1,nsite
c	write(*,*) tnew22(1,j)
c	enddo
c****************Calpha-6-7******two-body-pot*********
	tnew4=0
	do j=1,np2
	if(c3(j) .ne. c3(j-1).or. s3s1(j) .ne. s3s1(j-1)) then
	tnew4=0
	endif
	
	tnew31=tpot3(aseqn(s3s1(j)),aseqn(s3s2(j)))
	
	tnew32(c3(j),s3s1(j))= tnew4 + tnew31
	
	tnew4= tnew32(c3(j),s3s1(j))	
	enddo
c	do j=1,nsite
c	write(*,*) tnew32(1,j)
c	enddo
c****************Calpha-7-8******two-body-pot*********
	tnew5=0
	do j=1,np3
	if(c4(j).ne.c4(j-1).or.s4s1(j).ne.s4s1(j-1) ) then
	tnew5=0
	endif
	
	tnew51=tpot4(aseqn(s4s1(j)),aseqn(s4s2(j)))
	
	tnew52(c4(j),s4s1(j))= tnew5 + tnew51
	
	tnew5= tnew52(c4(j),s4s1(j))	
	enddo
c	do j=1,nsite
c	write(*,*) tnew52(1,j)
c	enddo
c****************Calpha-8-9******two-body-pot*********
	tnew6=0
	do j=1,np4
	
	if(c5(j) .ne. c5(j-1).or.s5s1(j).ne.s5s1(j-1)) then
	tnew6=0
	endif
	
	tnew61=tpot5(aseqn(s5s1(j)),aseqn(s5s2(j)))
	
	tnew62(c5(j),s5s1(j))= tnew6 + tnew61
	
	tnew6= tnew62(c5(j),s5s1(j))	
	enddo
c	do j=1,nsite
c	write(*,*) tnew62(1,j)
c	enddo
c****************Calpha-9-10******two-body-pot*********
	tnew7=0
	do j=1,np5
	
	if(c6(j) .ne. c6(j-1).or. s6s1(j).ne.s6s1(j-1)) then
	tnew7=0
	endif
	
	tnew71=tpot6(aseqn(s6s1(j)),aseqn(s6s2(j)))
	
	tnew72(c6(j),s6s1(j))= tnew7 + tnew71
	
	tnew7= tnew72(c6(j),s6s1(j))	
	enddo
c	do j=1,nsite
c	write(*,*) tnew72(1,j)
c	enddo
c****************Calpha-10-11******two-body-pot*********
	tnew8=0
	do j=1,np6
	
	if(c7(j) .ne. c7(j-1).or.s7s1(j).ne.s7s1(j-1)) then
	tnew8=0
	endif
	
	tnew81=tpot7(aseqn(s7s1(j)),aseqn(s7s2(j)))
	
	tnew82(c7(j),s7s1(j))= tnew8 + tnew81
	
	tnew8= tnew82(c7(j),s7s1(j))	
	enddo
c	do j=1,nsite
c	write(*,*) tnew82(1,j)
c	enddo
c****************Calpha-11-12******two-body-pot*********
	tnew9=0
	do j=1,np7
	
	if(c8(j) .ne. c8(j-1).or.s8s1(j).ne.s8s1(j-1)) then
	tnew9=0
	endif
	
	tnew91=tpot8(aseqn(s8s1(j)),aseqn(s8s2(j)))
	
	tnew92(c8(j),s8s1(j))= tnew9 + tnew91
	
	tnew9= tnew92(c8(j),s8s1(j))	
	enddo
c	do j=1,nsite
c	write(*,*) tnew92(1,j)
c	enddo
c****************Calpha-12-13******two-body-pot*********
	tnew10=0
	do j=1,np8

	if(c9(j) .ne. c9(j-1).or.s9s1(j).ne.s9s1(j-1)) then
	tnew10=0
	endif
	
	tnew101=tpot9(aseqn(s9s1(j)),aseqn(s9s2(j)))
	
	tnew102(c9(j),s9s1(j))= tnew10 + tnew101
	
	tnew10= tnew102(c9(j),s9s1(j))
	enddo
c	do j=1,nsite
c	write(*,*) tnew102(1,j)
c	enddo
c****************Calpha-13-14******two-body-pot*********
	tnew13=0
	do j=1,np9

	if(c10(j) .ne. c10(j-1).or.s10s1(j).ne.s10s1(j-1)) then
	tnew13=0
	endif
	
	tnew131=tpot10(aseqn(s10s1(j)),aseqn(s10s2(j)))
	
	tnew132(c10(j),s10s1(j))= tnew13 + tnew131
	
	tnew13= tnew132(c10(j),s10s1(j))	
	enddo

c	do j=1,nsite
c	write(*,*) tnew132(1,j)
c	enddo
c****************Calpha-14-15******two-body-pot*********
	tnew12=0
	do j=1,np10

	if(c11(j) .ne. c11(j-1).or.s11s1(j).ne.s11s1(j-1)) then
	tnew12=0
	endif
	
	tnew121=tpot11(aseqn(s11s1(j)),aseqn(s11s2(j)))
	
	tnew122(c11(j),s11s1(j))= tnew12 + tnew121
	
	tnew12= tnew122(c11(j),s11s1(j))	
	enddo

c	do j=1,nsite
c	write(*,*) tnew122(1,j)
c	enddo
c******onebody-nearest-number-dependent-upto-nn10*****************************
	do i=1,npro
	do j=1,nsite
	if(i .ne. i-1) then
	onenew=0
	endif
	do k1=1,nf
	
	onenew1=onepot(aseqn(j),k1,bin_index(i,k1,j))     	
     	onenew2(i,j)=onenew + onenew1
     	
     	onenew=onenew2(i,j)
	enddo
	enddo
	enddo
	
c	do j=1,nsite
c	write(*,*) onenew2(1,j)
c	enddo
c**********************************add-new-energy******************************	
	enew2=0
	do i=1,npro
	do j=1,nsite
	enew(i,j)=enew2+tnew2(i,j)+tnew22(i,j)+tnew32(i,j)
     $   +tnew52(i,j)+tnew62(i,j)+tnew72(i,j)+tnew82(i,j)+tnew92(i,j)
     $   +tnew102(i,j)+tnew132(i,j)+tnew122(i,j)+onenew2(i,j)
	enddo
	enddo

	en1=0
	do j=1,nsite
	en1=en1+enew(1,j)
	enddo
	
	eunnew=0
	do i=2,npro
	do j=1,nsite
	eunnew=eunnew + enew(i,j)
	enddo
	enddo

	eavunnew=eunnew/nupro
	
	delnew= en1-eavunnew

c	write(*,*) en1,eavunnew,eunnew,nupro,delnew

c********************condition of acceptance and rejection****************
	if (delnew .lt. delold1) then

	do i=1,nsite
	aseq(i)=aseqn(i)
	enddo
	
	delold=delnew
	
c	write(*,*) eold1,enew

	write(string1,"(F12.4)") delnew
	
	open(10,file="del-mc-step-n2/"//"del-mc-step-"//string2)
	write(10,*) string1
c	write(*,*) "accept"
c	delold1,delnew
		
	elseif (delnew .ge. delold1) then

	random=ran1(id)
	transp=exp(-((delnew)-(delold1))/kT)
c	write(*,*) delold1,delnew,random,transp,kT

	if(random .le. transp)then

	do i=1,nsite
	aseq(i)=aseqn(i)
	enddo

	delold=delnew
	
c	write(*,*) delold1,delnew
	write(string1,"(F12.4)") delnew
	
	open(10,file="del-mc-step-n2/"//"del-mc-step-"//string2)
	write(10,*) string1
c	write(*,*) "accept"
c	delold1,delnew

	else

	do i=1,nsite
	aseqn(i)=aseq(i)
	enddo

	delnew=delold
	
c	write(*,*) delold1,delnew
	write(string1,"(F12.4)") delold
	
	open(10,file="del-mc-step-n2/"//"del-mc-step-"//string2)
	write(10,*) string1
c	write(*,*) "reject"
	
	endif
	endif
	
	enddo

	open(13, file="mc-seq-n2/"//"del-"//string1//"-"//string2)

	do i=1,nsite
	write (13,*) aseqn(i)
	enddo
	
	open(14,file="mc-seq-n2/"//"res-en-"//string1//"-"//string2)
	
	do i=1,nsite
	write(14,*) tnew2(1,i)+tnew22(1,i)+tnew32(1,i)+tnew52(1,i)
     $   +tnew62(1,i)+tnew72(1,i)+tnew82(1,i)+tnew92(1,i)
     $   +tnew102(1,i)+tnew132(1,i)+tnew122(1,i)+onenew2(1,i)
	enddo
	
	enddo
	
	stop
	end
	
	function ran1(idum)
c
	integer idum,ia,im,iq,ir,ntab,ndiv
	real    ran1,am,eps,rnmx
c
      	parameter (ia=16807,im=2147483647,am=1./im,iq=127773,ir=2836)
      	parameter (ntab=32,ndiv=1+(im-1)/ntab,eps=1.2e-7,rnmx=1.-eps)
c
c     Numerical Rec. in Fortran, 2nd eD.  P. 271
c
      	integer j,k
      	integer iv(ntab),iy
      	save    iv,iy
      	data    iv,iy /ntab*0,0/
c
      	if (idum.le.0.or.iy.eq.0) then
         idum=max(-idum,1)
         do j=ntab+8,1,-1
            k    = idum/iq
            idum = ia*(idum-k*iq)-ir*k
            if(idum.lt.0) idum = idum+im
            if (j.le.ntab) iv(j) = idum
         enddo
         iy = iv(1)
      	endif
      	k    = idum/iq
      	idum = ia*(idum-k*iq)-ir*k
      	if(idum.lt.0) idum = idum+im
      	j     = 1+iy/ndiv
      	iy    = iv(j)
      	iv(j) = idum
      	ran1  = min(am*iy,rnmx)
c     	ran1  = cos(ran1*1.e8)

      	return
      	end
