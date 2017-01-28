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
		
		//Fonction de tri pour lister les scores en ordre décroissant.
		public function triBulles():Array	{
			
			var arr = new Array();
			for each(var iXML:XML in dataXML.joueur){
				arr.push(iXML);
			}
            var temp:XML;
                for(var i:uint=0; i < arr.length; i++)
                {
                    for(var j:uint=arr.length-1; j > i; j--)
                    {
						if (arr[j-1].score < arr[j].score){
							
                     		temp = arr[j-1];
           					arr[j-1] = arr[j];  
            				arr[j] = temp;
						}
                    }
                }
            
             return(arr);
		}

	}

}