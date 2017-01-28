//CLASSE CRÉÉE PAR: Tyler D., John A.
package {

	//Importer les classes nécessaires.
	import flash.net.SharedObject;

	public class Score {

		//Déclarer les variables.
		private var fichierXML:SharedObject;
		private var dataXML:XML;

		public function Score() {
			fichierXML=SharedObject.getLocal("Scores"); //Lire ou créer le fichier externe qui contient les scores.
			if (fichierXML.data.monXML==null) { //Si le fichier a été créé, initialiser le format XML.
				dataXML = 
				<scores>
				</scores>
				
				fichierXML.data.monXML=dataXML;
			}else{
				dataXML = fichierXML.data.monXML; //Sinon, prendre l'information XML du fichier.
			}
			
			triBulles(); //Trier les scores.
		}

		//Fonction pour ajouter un nouveau score.
		public function ajouterScore(score:int, nom:String) {
			//Créer le squelette du score.
			var nouvJoueur:XML = 
			<joueur>
				<score></score>
				<nom></nom>
			</joueur>
			
			//Accorder le score et le nom.
			nouvJoueur.score = score;
			nouvJoueur.nom = nom;
			
			//Ajouter le score au fichier XML.
			dataXML.appendChild(nouvJoueur);
		}
		
		//Fonction de tri de bulles pour lister les scores en ordre décroissant.
		public function triBulles():Array	{
			
			var arr = new Array();
			for each(var iXML:XML in dataXML.joueur){
				arr.push(iXML);
			}
            var temp:XML;
				//Boucle for qui passe à travers chaque indice dans le tableau arr
                for(var i:uint=0; i < arr.length; i++)
                {
					//Boucle for qui passe à travers l'indice -1 pour formé la comparaison entre deux éléments d'un tableau telle que le tri de bulles 
                    for(var j:uint=arr.length-1; j > i; j--)
                    {
						if (arr[j-1].score < arr[j].score){	//Lorsque la valeur de score du tableau arr (indice moins 1) est moins que la valeur dans l'indice normal de arr
							
                     		temp = arr[j-1];	//La valeur de temp est égale au nombre plus petit
           					arr[j-1] = arr[j];  //La valeur de l'indice qui possède la valeur plus petit prend la valeur de l'indice avec la valeur plus grande
            				arr[j] = temp;		//La valeur de l'indice qui possède la valeur plus grande prends la valeur plus petit
							//Donc une échange de valeur est fait pour déplacer la valeur plus grande vers l'indice le plus petit
						}	//Fin de l'énoncé if
                    }	//Fin de la boucle for (j)
                }	//Fin de la boucle for (i)
            
             return(arr);	//Retourne le tableau arr
		}	//Fin de la fonction triBulles

	}	//Fin de la classe score

}	//Fin du package