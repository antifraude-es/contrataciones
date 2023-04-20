# Empaquetar para distribuciones linux derivadas de Debian
deb-package:
	python3 setup.py --command-packages=stdeb.command bdist_deb

# Paquete python
standalone:
	echo "from  contrataciones.main import main; main()" > main.py
	PYTHONOPTIMIZE=1 pyinstaller main.py -F -n contrataciones --distpath dist/
	rm main.py

# Instalación para el usuario local
py-install:
	python3 setup.py install --user

# Agrupa todos los archivos del proyecto en un archivo ejecutable comprimido. No incluye intérprete ni bibliotecas.
py-bundle:
	rm -rf tmp
	mkdir -p tmp
	# Copiar ficheros recursivamente y reservar atributos
	for d in contrataciones contrataciones/utilities ; do \
	  mkdir -p tmp/$$d ;\
	  cp -pPR $$d/*.py tmp/$$d/ ;\
	done
	# Crea el punto de entrada y empaqueta los archivos
	echo "from  contrataciones.main import main; main()" > tmp/__main__.py
	cd tmp ; zip -q _contrataciones contrataciones/*.py contrataciones/*/*.py __main__.py
	# Añade la línea shebang y anexa el contenido del archivo zip
	echo '#!/usr/bin/python3' > contrataciones_bundled
	cat tmp/_contrataciones.zip >> contrataciones_bundled
	chmod a+x contrataciones_bundled
	rm -rf tmp
# Limpieza
clean:
	rm -rf build dist deb_dist Contrataciones.egg-info
	rm -rf Contrataciones*.snap Contrataciones-*.tar.gz main.spec
