<?php

    $list_quiz = [
        "Which is the only American state to begin with the letter 'p'?",
        "Name the world's biggest island?",
        "What is the world's longest river?",
        "Name the world's largest ocean?",
        "What is the diameter of Earth?",
        "Where would you find the world's most ancient forest?",
        "Which four British cities have underground rail systems?",
        "What is the capital city of Spain?",
        "Which country is Prague in?",
        "Which English town was a forerunner of the Parks Movement and the first city in Europe to have a street tram system?",
        "Name the actor who starred in 142 films including The Quiet Man, The Shootist, The Searchers and Stagecoach?",
        "Name the film noir actress who starred in I Married a Witch, The Glass Key, So Proudly We Hail! and Sullivan's Travels?",
        "What is the oldest film ever made, and when was it made?",
        "Which actress has won the most Oscars?",
        "Which actress said, \"Fasten your seatbelts. It's going to be a bumpy night,\" in All About Eve?",
        "Name the director of the Lord of the Rings trilogy?",
        "Who played Neo in The Matrix?",
        "Name the actress whose career began at the age of 3, and who went on to star in films such as Contact, Maverick and The Silence of the Lambs?",
        "Bray Studios, near Windsor in Berkshire, was home to which famous brand of horror films?",
        "In which film did Humphrey Bogart say, \"We'll always have Paris?",
        "What colour jersey is worn by the winners of each stage of the Tour De France?",
        "Name the only heavyweight boxing champion to finish his career of 49 fights without ever having been defeated?",
        "Which sport does Constantino Rocca play?",
        "Name the country where you would find the Cresta Run?",
        "How many times was the Men's Tennis Singles at Wimbledon won by Bjorn Borg?",
        "In 2011, which country hosted a Formula 1 race for the first time?",
        "Name the game played on a lawn called a 'crown green'?",
        "Which chess piece can only move diagonally?",
        "Name the only footballer to have played for Liverpool, Everton, Manchester City and Manchester United?",
        "In football, who was nicknamed 'The Divine Ponytail'?",
    ];

    function make_quiz($quiz_no, $up=False){
        $quiz_no = intval($quiz_no);
        if($up){
            $quiz_no+=1;
        }
        global $list_quiz;
        $quiz = null;
        switch($quiz_no){
            case 0:
                $quiz = "Hello, I believe that you are wonder what is behind this website! But, are you ready to answer our quizs? If you are lucky, you would get what you need ;).";
                break;
            case 1:
                $quiz =  "How pretty are you ?";
                break;
            case 2:
                $quiz = "Relax, here is the hint: [admin]";
                break;
            case 5:
                $quiz = "Great, here is the second hint: [source_882c1aaf3.zip]";
                break;
            default:
                $quiz = $list_quiz[rand(0,count($list_quiz)-1)];
                break;
        }
        setcookie("quiz_no", $quiz_no, time() + (86400 * 30), "/");
        return $quiz;
    }

    class SaveAnswer {
        private $folder = 'C:\\Windows\\Temp\\';
        private $filename;
        private $anscontent;

        public function __construct($username, $email, $ans)
        {
            $this->filename = $username.'_'.str_replace(['@','.',' '],'_',$email);
            $this->anscontent = (string)$ans;
        }

        private function writeToFile($mode){
            $fullpath = $this->folder.$this->filename;

            if(!file_exists($fullpath.'.txt')){
                if(!preg_match('/^C:\x5cWindows\x5cTemp\x5c[a-zA-Z0-9\.\_]+$/i',$fullpath)){
                    return False;
                }
            }

            try{
                $file = fopen($fullpath.".txt", $mode);
                fwrite($file, $this->anscontent);
                fclose($file);
            } catch(Exception $e){
                return False;
            }
            return True;
        }

        public function __destruct()
        {
            $this->writeToFile("a+");
        }
    }


?>