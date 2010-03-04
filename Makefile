
all : bin/Easy bin/HelloWorld bin/TreeFractal bin/SnowFlake bin/TreeZen bin/ClockFractal bin/Styrene

# -- files that are ready to compile
src_Graphics_hs		=  $(shell find src -name "*.hs" -follow)

bin/Easy : examples/Easy/Main.hs $(src_Graphics_hs)
	ghc -O2 -isrc --make examples/Easy/Main.hs -o bin/Easy

bin/HelloWorld : examples/HelloWorld/Main.hs $(src_Graphics_hs)
	ghc -O2 -isrc --make examples/HelloWorld/Main.hs -o bin/HelloWorld

bin/TreeFractal : examples/TreeFractal/Main.hs $(src_Graphics_hs)
	ghc -O2 -isrc --make examples/TreeFractal/Main.hs -o bin/TreeFractal

bin/SnowFlake : examples/SnowFlake/Main.hs $(src_Graphics_hs)
	ghc -O2 -isrc --make examples/SnowFlake/Main.hs -o bin/SnowFlake

bin/TreeZen : examples/TreeZen/Main.hs $(src_Graphics_hs)
	ghc -O2 -isrc --make examples/TreeZen/Main.hs -o bin/TreeZen

bin/ClockFractal : examples/ClockFractal/Main.hs $(src_Graphics_hs)
	ghc -O2 -isrc --make examples/ClockFractal/Main.hs -o bin/ClockFractal

bin/Styrene : examples/Styrene/Main.hs $(src_Graphics_hs)
	ghc -O2 -isrc -iexamples/Styrene --make examples/Styrene/Main.hs -o bin/Styrene


.PHONY : clean
clean :
	@find . 	-name "*.o" \
		-o 	-name "*.hi" \
		| xargs rm
		
	@rm -f bin/*
	
.PHONY : doc
doc :
	haddock -w -h -o doc --optghc=-isrc $(src_Graphics_hs)
