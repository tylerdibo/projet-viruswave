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

	}

}