#include <ap_fixed.h>
#include <cstdio>


#define GA_BW 28
#define GA_IW 11
#define N_GERACOES   	200
#define TAMANHO_POP  	200
#define TAXA_MUTACAO ((ga_data_t)0.02)  	// porcentagem em que o individuo sofre desvio do valor do gene
#define	MAX_X  		((ga_data_t) 5.0)	//valor maximo de x
#define MIN_X 		((ga_data_t)-5.0) 	// valo minimo de x
#define MAX_Y  		((ga_data_t) 5.0) 	//valor maximo de y
#define MIN_Y 		((ga_data_t)-5.0)
#define SOMA 		((ga_data_t) 1)
#define SUBTRAI 	((ga_data_t) -1)
#define MAXRAND ((ga_data_t) 1023.98) //FALTA ANALIZAR SE EH ISSO MSM .

unsigned int seed = 1;


typedef ap_fixed<GA_BW, GA_IW> ga_data_t;
typedef  struct Pontos
	{
		ga_data_t x,y;
		ga_data_t desempenho;
	}individuo_t;

typedef struct {
	individuo_t best;
	bool finished_flag;
} ga_out_t;


individuo_t  populacao[TAMANHO_POP];


ga_data_t Funcao_Custo(individuo_t w);
void	inicia_Populcao(void);
ga_data_t pseudo_random(unsigned int seed, int load);
void calcula_Desempenho(void);
void bubble_sort(individuo_t individuos[TAMANHO_POP]);
void mutacao(void);
ga_data_t abs(ga_data_t valor);
void reproducao(void);

ga_out_t result;

void ga_top(bool start) {

#pragma HLS interface ap_none port=result


	if (start) {
		result.finished_flag = false;
		inicia_Populcao();


		for(int i =0;i<N_GERACOES;i++)
			{
				calcula_Desempenho();
				mutacao();
				bubble_sort(populacao);
				reproducao();
			}

		calcula_Desempenho();
		bubble_sort(populacao);

		result.finished_flag = true;
		result.best = populacao[0];
	}
}

int main(int argc, char **argv)
	{


		inicia_Populcao();


		for(int i =0;i<N_GERACOES;i++)
			{
				calcula_Desempenho();
				mutacao();
				bubble_sort(populacao);
				reproducao();
			}

		calcula_Desempenho();
		bubble_sort(populacao);

		for(int i =0;i<TAMANHO_POP;i++ )
			{
				printf("individuo %d ------> (%f , %f) = %f\n",i,populacao[i].x.to_float(),populacao[i].y.to_float(),populacao[i].desempenho.to_float() );
			}


		//individuo_t teste ;
		//teste.x = ((ga_data_t)-15.0);
		//teste.y = ((ga_data_t)0.0);
		//teste.desempenho = Funcao_Custo(teste);
		//printf("teste de desempenho validar funcao custo valor (x,y) = (%f,%f) e DESEMPENHO %f \n",teste.x.to_float(),teste.y.to_float(),teste.desempenho.to_float());

	}


void inicia_Populcao(void)
	{
		ga_data_t x,r,y;

		r = pseudo_random(seed, 1);
		r = pseudo_random(seed, 1);
		seed += 5010000;
		for (int i = 0 ; i< TAMANHO_POP ; i++)
		{
			x = pseudo_random(seed, 1);
			seed += 5000000;
			x = abs(x);
			y = pseudo_random(seed, 1);
			seed += 5000000;
			y = abs(y);
			x = (x/MAXRAND); // convertendo para um intervalo de 0 a 1
			x = (x*(((ga_data_t) 2.0))*MAX_X) + MIN_X; // mapeando para um intervalo determinado pelo range dos valores de x
			y = (y/MAXRAND); // convertendo para um intervalo de 0 a 1
			y = y*(((ga_data_t) 2.0)*MAX_Y) + MIN_Y;// mapeando para um intervalo determinado pelo range dos valores de y

			populacao[i].x = x;
			populacao[i].y = y;
		}
	}



ga_data_t Funcao_Custo(individuo_t w)
	{
		ga_data_t resultado ;
		resultado = ( (w.x*w.x + w.y - ((ga_data_t)11))*(w.x*w.x + w.y - ((ga_data_t)11)) + (w.x +w.y*w.y -((ga_data_t)7))*(w.x + w.y*w.y -((ga_data_t)7)) );
		return resultado;
	}


ga_data_t pseudo_random(unsigned int seed, int load)
	{
		ga_data_t retorno;
		static ap_uint<32> lfsr;

		if (load ==1 )
			lfsr = seed;
		bool b_32 = lfsr.get_bit(32-32);
		bool b_22 = lfsr.get_bit(32-22);
		bool b_2 = lfsr.get_bit(32-2);
		bool b_1 = lfsr.get_bit(32-1);
		bool new_bit = b_32 ^ b_22 ^ b_2 ^ b_1;
		lfsr = lfsr >> 1;
		lfsr.set_bit(31, new_bit);
		if(lfsr > 1023 || lfsr < -1023){
			retorno = 980 - lfsr ;
		}
		return ((ga_data_t)retorno);
	}

void calcula_Desempenho(void)
	{
//		printf("\n\n\n\n   #####################       DESEMPENHO            ########################\n\n\n");
		for(int i =0 ; i < TAMANHO_POP; i++)
			{
//#pragma HLS unroll factor=8
				populacao[i].desempenho = Funcao_Custo(populacao[i]);
			}
	}


void bubble_sort(individuo_t individuos[TAMANHO_POP]) {
	individuo_t aux;
	bool trocado;

	do {
		trocado = false;

		for (int i = 0; i < TAMANHO_POP - 1; i++) {
			if (individuos[i].desempenho > individuos[i + 1].desempenho) {
				aux = individuos[i + 1];
				individuos[i + 1] = individuos[i];
				individuos[i] = aux;

				trocado = true;
			}
		}
	} while (trocado);
}

void mutacao(void)
	{
		ga_data_t j;
		int indv;
		int soma_ou_subtrai;
		ga_data_t k;
		ga_data_t novo_X;
		ga_data_t novo_Y;
		j = pseudo_random(seed,1);
		seed += 5000000;
		// printf("\n\n\n\n          #######################            MUTACAO          ###################\n\n\n");
		for(int i =0;i<100;i++)
			{

				j = pseudo_random(seed,1)/MAXRAND; 		//sorteia um individuo j aleatoriamente
				seed += 5000000;
				j = abs(j);
				j = ((ga_data_t)TAMANHO_POP)*j;
				indv = j.to_int();
				k =  pseudo_random(seed,1)/MAXRAND;		// sorteia um numero entre 0 e 1 para definir se a mutacao causara um desvio negativo ou positivo
				k = abs(k);
				seed += 5000000;
				if(k >= ((ga_data_t) 0.5)){
					soma_ou_subtrai = SOMA;
				}
				else{
					soma_ou_subtrai = SUBTRAI;
				}
				novo_X = (populacao[indv].x)*(((ga_data_t) 1) + TAXA_MUTACAO*(soma_ou_subtrai));

				if((novo_X<=MAX_X)&&(novo_X>=MIN_X))
					{
						populacao[indv].x = novo_X;
					}



				j = pseudo_random(seed,1)/MAXRAND; 		//sorteia um individuo j aleatoriamente
				seed += 5000000;
				j = abs(j);
				j = ((ga_data_t)TAMANHO_POP)*j;
				indv = j.to_int(); 		//sorteia um individuo j aleatoriamente
				k = (pseudo_random(seed,1))/MAXRAND;		// sorteia um numero entre 0 e 1 para definir se a mutacao causara um desvio negativo ou positivo
				seed += 5000000;
				if(k >= ((ga_data_t) 0.5)){
					soma_ou_subtrai = SOMA ;

				}
				else{
					soma_ou_subtrai = SUBTRAI;
				}
				novo_Y = (populacao[indv].y)*(((ga_data_t) 1) + TAXA_MUTACAO*(soma_ou_subtrai));

				if((novo_Y<=MAX_Y)&&(novo_Y>=MIN_Y))
					{
						populacao[indv].y = novo_Y;
					}


			}
	}

ga_data_t abs(ga_data_t valor){
	if(valor < 0)
		{
			valor = -valor;
		}
	return valor;
}


void reproducao(void)
	{

		individuo_t new_Populacao[TAMANHO_POP];
		int j =0;
		int parent1 ,parent2;
		ga_data_t v;
		v = (((ga_data_t)TAMANHO_POP)/((ga_data_t)2));
		parent1 = (pseudo_random(seed,1).to_int()%v.to_int());
		seed += 5000000;
		for(int i = 0 ;i< TAMANHO_POP/4 ; i++)
		{
			v = ((ga_data_t)TAMANHO_POP)/((ga_data_t)2);
			parent1 = (pseudo_random(seed,1).to_int()%v.to_int());
			seed += 5000000;
			parent1 = abs(parent1);

			v = ((ga_data_t)TAMANHO_POP)/((ga_data_t)2);
			parent2 = (pseudo_random(seed,1).to_int()%v.to_int());
			seed += 5000000;
			parent2 = abs(parent2);
			while((parent1-parent2)>25)
				{
					v = ((ga_data_t)TAMANHO_POP)/((ga_data_t)2);
					//printf("dentro do while parents iguais\n");
					parent2 = (pseudo_random(seed,1).to_int()%v.to_int());
					seed += 5000000;
				}

			while(parent1 == parent2)
				{
					v = ((ga_data_t)TAMANHO_POP)/((ga_data_t)2);
					parent2 = (pseudo_random(seed,1).to_int()%v.to_int());
					seed += 5000000;

				}
			individuo_t new1 ;
			individuo_t	 new2 ;

			new1.x = populacao[parent1].x ;
			new1.y = populacao[parent2].y ;

			new2.x = populacao[parent2].x ;
			new2.y = populacao[parent2].y ;

			new_Populacao[j] = populacao[parent1];
			new_Populacao[j+1] = populacao[parent2];
			new_Populacao[j+2] = new1;
			new_Populacao[j+3] = new2;

			j= j+4;

		}


		for(int i =0;i<TAMANHO_POP;i++)
			{
				populacao[i] = new_Populacao[i];
			}




	}
