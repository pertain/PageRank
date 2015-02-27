/* LoopTwo.java
 *
 * This script performs the second loop in my pagerank script (pagerank.sh).
 * The bash script was far too slow without using a buffered file reader,
 * so this script was created (along with LoopOne.java) to make the process
 * more efficient.
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class LoopTwo {
	public static final String I_FILE = "I.txt";
	public static final String R_FILE = "R.txt";
	public static final String I_TEMP = "temp_I.txt";
	public static final double LAMBDA = 0.15;
	public static final double TAU = 0.01;

	public static void main(String[] args) throws IOException {

		/* these are passed as arguments from bash script */
		int iSize = Integer.parseInt(args[0]);				// qty of pages in I_FILE
		double firstTerms = Double.parseDouble(args[1]);	// first terms of PR expression

		boolean isConverged = false;

		File iFile = new File(I_FILE);
		File rFile = new File(R_FILE);
		File tempFile = new File(I_TEMP);

		BufferedReader iBr = new BufferedReader(new FileReader(iFile));
		BufferedReader rBr = new BufferedReader(new FileReader(rFile));

		if(tempFile.exists()){
			tempFile.delete();
			tempFile.createNewFile();
		}

		BufferedWriter tempBw = new BufferedWriter(new FileWriter(tempFile,true));

		String rLine = rBr.readLine();
		String [] rLineContents = rLine.split("\t");

		/* iterate through every line in I_FILE & R_FILE in parallel */
		double sumOfDiffs = 0;
		while(iBr.ready()){
			double rSum = 0;

			/* read line in I_FILE */
			String iLine = iBr.readLine();
			
			/* parse line in I_FILE */
			String [] iLineContents = iLine.split("\t");
			String iPage = iLineContents[0];
			int iOutlinkQty = Integer.parseInt(iLineContents[1]);
			double iPagerank = Double.parseDouble(iLineContents[2]);

			while(rLineContents[0].equals(iPage) && rBr.ready()){

				String rPage = rLineContents[0];
				double rPagerank = Double.parseDouble(rLineContents[2]);

				/* sum pageranks for every inlink of curr page in I_FILE */
				rSum += rPagerank;

				/* read line in R_FILE */
				rLine = rBr.readLine();

				/* parse line in R_FILE */
				rLineContents = rLine.split("\t");
			}

			/* calculate third term for new pagerank expression */
			double term3 = (1 - LAMBDA) * rSum;

			/* calculate new pagerank for curr page in I_FILE */
			double newPagerank = firstTerms + term3;

			/* write values to I_TEMP (will replace I_FILE at conclusion of this pass) */
			tempBw.write(iPage + "\t" + iOutlinkQty + "\t" + String.format("%.15f", newPagerank));
			tempBw.newLine();

			/* calculate sum of differences between old pageranks and new pageranks */
			double prDiff = Math.abs(newPagerank - iPagerank);
			sumOfDiffs += prDiff;
		}

		/* determine if the iteration has converged */
		if(sumOfDiffs < TAU){
			isConverged = true;
		}

		/* print isConverged to stdout so bash script can store it */
		System.out.println(isConverged);

		tempBw.flush();
		tempBw.close();
	}
}
