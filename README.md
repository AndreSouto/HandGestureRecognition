Final Project - IPI

Paper: Hand Gesture Recognition

André Luis Souto - 14/0016261
Rafaela Sinhoroto -
Raphael Soares Ramos - 14/0160299

Para treinar a cnn basta executar o seguinte comando:
$ python3 train_Xception.py --dataset marcel --model output/Xception.model --label-bin output/Xception_lb.pickle --plot output/Xception_plot.png

Novas predições podem ser feitas usando o script predict.py (localizado na pasta CNN/predict) a partir do arquivo model e pickle disponibilizados na pasta CNN/resultados/Xception-2.0. 

Os arquivos de logs dos scripts de treino e plots estão disponíveis na pasta resultados. Foi utilizado a biblioteca OpenCV, versão 3.4.2, para carregar as imagens. Para realizar operações sobre matrizes e vetores,a biblioteca de computação numérica em Python,
NumPy foi escolhida. Usei ainda, como linguagem, Python 3.5.2. Por fim, foram usadas as bibliotecas Keras e Tensorflow para o treinamento e construção de redes neurais. O treinamento foi realizado com o uso de um servidor Intel Xeon 24-cores com 160 GB de memória RAM e uma placa de vídeo GeForce GTX 750.

O dataset Marcel (http://www.idiap.ch/resource/gestures/) utilizado está disponível no seguinte link: https://www.dropbox.com/sh/z4otcmj2bvaifor/AADK0UL7x4Tn8oiRjadYJHeIa?dl=0.

Os arquivos do modelo Xception-2.0, necessários para novas predições, estão disponíveis no seguinte link: https://www.dropbox.com/sh/k21z2vfywtknjsx/AAAeLAamkusP4Mjqi5WxmtnYa?dl=0.



