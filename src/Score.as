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
			
			triBulles();
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