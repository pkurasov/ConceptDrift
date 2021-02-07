/*
 *    DriftDetectionMethodClassifier.java
 *    Copyright (C) 2008 University of Waikato, Hamilton, New Zealand
 *    @author Manuel Baena (mbaena@lcc.uma.es)
 *
 *    This program is free software; you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation; either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

package moa.classifiers.meta;

import com.github.javacliparser.AbstractOption;
import com.github.javacliparser.FileOption;
import com.github.javacliparser.FlagOption;
import com.github.javacliparser.IntOption;
import com.yahoo.labs.samoa.instances.Instance;

import moa.classifiers.meta.Others.DuEvaluateModel;
import moa.classifiers.meta.Others.Output;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import moa.classifiers.AbstractClassifier;
import moa.classifiers.Classifier;

import moa.classifiers.MultiClassClassifier;

import moa.classifiers.meta.WEKAClassifier;
import moa.core.DoubleVector;
import moa.core.Measurement;
import moa.core.Utils;
import moa.classifiers.core.driftdetection.ChangeDetector;
import moa.options.ClassOption;

/**
 * Class for handling concept drift datasets with a wrapper on a
 * classifier.<p>
 *
 * Valid options are:<p>
 *
 * -l classname <br>
 * Specify the full class name of a classifier as the basis for
 * the concept drift classifier.<p>
 * -d Drift detection method to use<br>
 *
 * @author Manuel Baena (mbaena@lcc.uma.es)
 * @version 1.1
 */
public class DDMbyDu extends AbstractClassifier implements MultiClassClassifier {

    private static final long serialVersionUID = 1L;

    @Override
    public String getPurposeString() {
        return "Classifier that replaces the current classifier with a new one when a change is detected in accuracy.";
    }
    
    public ClassOption baseLearnerOption = new ClassOption("baseLearner", 'l',
            "Classifier to train.", Classifier.class, "bayes.NaiveBayes");
    
    public ClassOption driftDetectionMethodOption = new ClassOption("driftDetectionMethod", 'd',
             "Drift detection method to use.", ChangeDetector.class, "DDM");
    
  //********************************************************************************
    //These options are for evaluation only
    //Output option
    public IntOption instanceSizeOption = new IntOption("instanceSize", 'i',
    		"The number of instances.", 1000, 1, Integer.MAX_VALUE);
    
    public FlagOption slideWindowOption = new FlagOption("slidewindowoption", 'w',
            "Boost with weights only; no poisson.");
    
    public IntOption concpetOption = new IntOption("conceptPosition", 'c',
    		"The position of concept drift.", 1000, 1, Integer.MAX_VALUE);
    
    public IntOption slidwindowsizeOption = new IntOption("slidewindowsize", 's',
    		"Slide Window Size.", 1000, 1, Integer.MAX_VALUE);
    
    public IntOption runTimesOption = new IntOption("runTimes", 'u',
    		"The times.", 1000, 1, Integer.MAX_VALUE);
    
    public FileOption outputFileOption = new FileOption("outputFile", 'f',
            "Destination ARFF file.", null, "xls", true);
    
    protected DuEvaluateModel evaluateModel = new DuEvaluateModel();
    protected Output output = new Output();
    
    //********************************************************************************

    protected Classifier classifier;

    protected Classifier newclassifier;

    protected ChangeDetector driftDetectionMethod;

    protected boolean newClassifierReset;
    //protected int numberInstances = 0;

    protected int ddmLevel;

    public boolean isWarningDetected() {
        return (this.ddmLevel == DDM_WARNING_LEVEL);
    }

    public boolean isChangeDetected() {
        return (this.ddmLevel == DDM_OUTCONTROL_LEVEL);
    }

    public static final int DDM_INCONTROL_LEVEL = 0;

    public static final int DDM_WARNING_LEVEL = 1;

    public static final int DDM_OUTCONTROL_LEVEL = 2;
    
    @Override
    public void resetLearningImpl() {
        this.classifier = ((Classifier) getPreparedClassOption(this.baseLearnerOption)).copy();
        this.newclassifier = this.classifier.copy();
        this.classifier.resetLearning();
        this.newclassifier.resetLearning();
        this.driftDetectionMethod = ((ChangeDetector) getPreparedClassOption(this.driftDetectionMethodOption)).copy();
        this.newClassifierReset = false;
        
      //******************************************************
        this.evaluateModel.evaluateInitialize(this.instanceSizeOption.getValue(), this.concpetOption.getValue(), this.slideWindowOption.isSet(), this.slidwindowsizeOption.getValue());
        //******************************************************
    }

    protected int changeDetected = 0;

    protected int warningDetected = 0;

    @Override
    public void trainOnInstanceImpl(Instance inst) {
        //this.numberInstances++;
        int trueClass = (int) inst.classValue();
        boolean prediction;
        if (Utils.maxIndex(this.classifier.getVotesForInstance(inst)) == trueClass) {
            prediction = true;
        } else {
            prediction = false;
        }
        //this.ddmLevel = this.driftDetectionMethod.computeNextVal(prediction);
        this.driftDetectionMethod.input(prediction ? 0.0 : 1.0);
        this.ddmLevel = DDM_INCONTROL_LEVEL;
        if (this.driftDetectionMethod.getChange()) {
         this.ddmLevel =  DDM_OUTCONTROL_LEVEL;
        }
        if (this.driftDetectionMethod.getWarningZone()) {
           this.ddmLevel =  DDM_WARNING_LEVEL;
        }
        switch (this.ddmLevel) {
            case DDM_WARNING_LEVEL:
                //System.out.println("1 0 W");
            	//System.out.println("DDM_WARNING_LEVEL");
                if (newClassifierReset == true) {
                    this.warningDetected++;
                    this.newclassifier.resetLearning();
                    newClassifierReset = false;
                }
                this.newclassifier.trainOnInstance(inst);
                break;

            case DDM_OUTCONTROL_LEVEL:
                //System.out.println("0 1 O");
            	//System.out.println("DDM_OUTCONTROL_LEVEL");
                this.changeDetected++;
                this.classifier = null;
                this.classifier = this.newclassifier;
                if (this.classifier instanceof WEKAClassifier) {
                    ((WEKAClassifier) this.classifier).buildClassifier();
                }
                this.newclassifier = ((Classifier) getPreparedClassOption(this.baseLearnerOption)).copy();
                this.newclassifier.resetLearning();
                break;

            case DDM_INCONTROL_LEVEL:
                //System.out.println("0 0 I");
            	//System.out.println("DDM_INCONTROL_LEVEL");
                newClassifierReset = true;
                break;
            default:
            //System.out.println("ERROR!");

        }

        this.classifier.trainOnInstance(inst);
    }

    public double[] getVotesForInstance(Instance inst) {
    	//****************************************************************
        //Evaluation Only
    	DoubleVector vote = new DoubleVector(this.classifier.getVotesForInstance(inst));
        if(vote.sumOfValues() > 0) {
			 vote.normalize();
		}
        
        this.evaluateModel.evaluation(inst, vote);
        if(this.evaluateModel.getNumOfExamplesReceived() == this.instanceSizeOption.getValue()) {
        	try {
        		this.output.fullToXls(this.evaluateModel.getResults(), this.outputFileOption.getValue(), this.runTimesOption.getValue());
      		} catch (IOException e) {
      			// TODO Auto-generated catch block
      			e.printStackTrace();
      		}
        	
        	List<AbstractOption> options = new ArrayList<AbstractOption>();
			options.add(this.runTimesOption);

			
			try {
				this.output.MeasurementToTxt(this.evaluateModel.getMeasurement(), this.outputFileOption.getValue(), options);
				//this.output.MeasurementGMeanToTxt(this.outputFileOption.getValue(), this.evaluateModel.getGMean());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        //****************************************************************
    	
        return this.classifier.getVotesForInstance(inst);
    }

    @Override
    public boolean isRandomizable() {
        return true;
    }

    @Override
    public void getModelDescription(StringBuilder out, int indent) {
        ((AbstractClassifier) this.classifier).getModelDescription(out, indent);
    }

    @Override
    protected Measurement[] getModelMeasurementsImpl() {
        List<Measurement> measurementList = new LinkedList<Measurement>();
        measurementList.add(new Measurement("Change detected", this.changeDetected));
        measurementList.add(new Measurement("Warning detected", this.warningDetected));
        Measurement[] modelMeasurements = ((AbstractClassifier) this.classifier).getModelMeasurements();
        if (modelMeasurements != null) {
            for (Measurement measurement : modelMeasurements) {
                measurementList.add(measurement);
            }
        }
        this.changeDetected = 0;
        this.warningDetected = 0;
        return measurementList.toArray(new Measurement[measurementList.size()]);
    }

}