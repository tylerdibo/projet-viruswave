package {

	import flash.net.SharedObject;

	public class Score {

		private var fichierXML:SharedObject;
		private var dataXML:XML;

		public function Score() {
			fichierXML=SharedObject.getLocal("Scores");
			if (fichierXML.data.monXML==null) {
				dataXML = 
				<scores>
				</scores>
				
				fichierXML.data.monXML=dataXML;
			}else{
				dataXML = fichierXML.data.monXML;
			}

			ajouterScore(1000, "Tyler");
			ajouterScore(2000, "John");
			
			trace(dataXML);
		}

		public function ajouterScore(score:uint, nom:String) {
			var nouvJoueur:XML = 
			<joueur>
				<score></score>
				<nom></nom>
			</joueur>
			
			nouvJoueur.score = score;
			nouvJoueur.nom = nom;
			
			dataXML.appendChild(nouvJoueur);
		}
		
		public function triBulles()	{
			
			var arr = new Array(7,2,10,4);
            var temp:int;
                for(var i:uint=0; i < arr.length; i++)
                {
                    for(var j:uint=arr.length-1; j > i; j--)
                    {
						if (arr[j-1] < arr[j]){
							
                     		temp = arr[j-1];
           					arr[j-1] = arr[j];  
            				arr[j] = temp;
						}
                    }
                }
            
             trace(arr);
		}

	}

}