<?php

class Cabecera extends FPDF
{
	function Header()
	{
	    // Select Arial bold 15
	    $this->SetFont('Arial','B',15);
	    // Move to the right
	    $this->Cell(80);
	    // Framed title
	    $this->Cell(30,10,'Title',1,0,'C');
	    // Line break
	    $this->Ln(20);
	}
}