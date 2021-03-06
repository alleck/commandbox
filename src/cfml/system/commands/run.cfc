/**
 * Execute an operation system level command.  By default, "run" will wait 60 seconds for the command to complete
 * .
 * {code:bash}
 * run "C:\Windows\System32\SoundRecorder.exe"
 * {code}
 * .
 * Wait a max of 10 seconds for the command to finish.
 * .
 * {code:bash}
 * run cmd "/c npm ll" 10
 * {code}
 * .
 * Kick off the command asyncronoysly and don't wait at all.  Also, discard any output.
 * .
 * {code:bash}
 * run myApp.exe 0
 * {code}
 * .
 * Executing Java would look like this
 * .
 * {code:bash}
 * run java "-jar myLib.jar"
 * {code}
 *
 **/
component extends="commandbox.system.BaseCommand" aliases="" excludeFromHelp=false{

	/**
	* @name.hint The full pathname of the application to execute including extension
	* @arguments.hint Command-line arguments passed to the application
	* @timeout.hint Ho many seconds to wait. A timeout of 0 returns immediatley without waiting, ignoring any output from the command.
	**/
	function run(
		required name,
		args="",
		numeric timeout=60
	){

		var executeResult 	= "";
		var executeError 	= "";

		try{
			// execute the server command
			execute name="#arguments.name#" arguments="#arguments.args#" timeout="#arguments.timeout#" variable="executeResult" errorvariable="executeError";
			// Output Results
			if( len( executeResult ) ) {
				print.cyanLine( executeResult );				
			}
			// Output error
			if( len( executeError ) ) {
				print.redLine( executeError );				
			}
			
			print.greenLine( "Command completed succesfully!" );
		
		} catch (any e) {
			error( '#e.message##CR##e.detail#' );
		}

	}

}