/* LoopOne.java
 *
 * This script performs the first loop in my pagerank script (pagerank.sh).
 * The bash script was far too slow without using a buffered file reader,
 * so this script was created (along with LoopTwo.java) to make the process
 * more efficient.
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class LoopOne {
    public static final String I_FILE = "I.txt";
    public static final String R_FILE = "R.txt";
    public static final double LAMBDA = 0.15;

    public static void main(String[] args) throws IOException {

        /* these are passed as arguments from bash script */
        int iSize = Integer.parseInt(args[0]);  // qty of pages in I_FILE
        String linksFile = args[1];             // file containing links

        File links  = new File(linksFile);
        File iFile = new File(I_FILE);
        File rFile = new File(R_FILE);

        BufferedReader lBr = new BufferedReader(new FileReader(links));
        BufferedReader iBr = new BufferedReader(new FileReader(iFile));

        if(rFile.exists()){
            rFile.delete();
            rFile.createNewFile();
        }

        BufferedWriter rBw = new BufferedWriter(new FileWriter(rFile,true));

        String lLine = lBr.readLine();
        String [] lLineContents = lLine.split("\t");

        /* iterate through every line in I_FILE & linksFile in parallel */
        double terminalSum = 0.0;
        while(iBr.ready()){

            /* read line in I_FILE */
            String iLine = iBr.readLine();
            
            /* parse line in I_FILE */
            String [] iLineContents = iLine.split("\t");
            String iPage = iLineContents[0];
            int iOutlinkQty = Integer.parseInt(iLineContents[1]);
            double iPagerank = Double.parseDouble(iLineContents[2]);

            /* Ip (pagerank for curr line in I) / |Q| (outlink qty for curr line in I) */
            double IpOverQ = iPagerank / iOutlinkQty;

            /* sum pagerank for all terminal links */
            if(iOutlinkQty == 0){
                terminalSum += iPagerank;
            }else{

                while(lLineContents[0].equals(iPage) && lBr.ready()){

                    String lPage = lLineContents[0];
                    String lLink = lLineContents[1];

                    /* write values to R_FILE */
                    rBw.write(lLink + "\t" + lPage + "\t" + String.format("%.15f", IpOverQ));
                    rBw.newLine();

                    /* read line in linksFile */
                    lLine = lBr.readLine();
                    
                    /* parse line in linksFile */
                    lLineContents = lLine.split("\t");
                }
            }
        }

        /* calculate first two terms for new pagrank expression (used in LoopTwo) */
        double term1 = LAMBDA / iSize;
        double term2 = ((1 - LAMBDA) * terminalSum) / iSize;
        double firstTwoTerms = term1 + term2;

        /* print firstTwoTerms to stdout so bash script can store it */
        System.out.println(String.format("%.15f", firstTwoTerms));

        rBw.flush();
        rBw.close();
    }
}
