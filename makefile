BUILD_DIR := out

.SILENT: final quick

format:
	latexindent.pl -w src/main.tex src/chapters/*.tex
	rm src/indent.log src/chapters/indent.log

clean:
	rm $(BUILD_DIR)/*.aux src/*.bak* $(BUILD_DIR)/*.bbl $(BUILD_DIR)/*.blg $(BUILD_DIR)/*.log $(BUILD_DIR)/*.out $(BUILD_DIR)/*.toc

final:
	pdflatex -interaction nonstopmode -halt-on-error -file-line-error -output-directory $(BUILD_DIR) src/main.tex
	bibtex $(BUILD_DIR)/main
	pdflatex -interaction nonstopmode -halt-on-error -file-line-error -output-directory $(BUILD_DIR) src/main.tex
	pdflatex -interaction nonstopmode -halt-on-error -file-line-error -output-directory $(BUILD_DIR) src/main.tex
	

quick:
	pdflatex -interaction nonstopmode -halt-on-error -file-line-error -output-directory $(BUILD_DIR) src/main.tex

	echo "---------------- ATTENTION ----------------"
	echo "Only compiled, did NOT update bibliography!"
	
diag:
	pdflatex -interaction nonstopmode -halt-on-error -file-line-error -output-directory $(BUILD_DIR) src/diagramm.tex