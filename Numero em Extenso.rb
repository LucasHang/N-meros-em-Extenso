def tem_mais_numero? falta,divisor
	falta = falta/divisor
	if  falta > 0 && falta < 10  
		return true
	end
end

def numeroPortugues numero
  if numero < 0  
    return 'Por favor, digite um número positivo.'
  end
  if numero == 0
    return 'zero'
  end
  
  numExtenso = [] 
  
  unidades = ['','um','dois','tres','quatro','cinco',
            	'seis','sete','oito','nove']

  dezenas = ['','dez','vinte','trinta','quarenta','cinquenta',
            'sessenta','sessenta','oitenta','noventa']

  especiais = ['','onze','doze','treze','catorze','quinze',
              'dezesseis','dezesete','dezoito','dezenove']

	centena = ['','cem','duzentos','trezentos','quatrocentos','quinhentos',
            'seiscentos','setecentos','oitocentos','novecentos']
  
  falta  = numero

	escrevendo = falta/1000000000           
  falta  = falta - escrevendo*1000000000 
  
  if escrevendo > 0
   
	 	auxiliar = numeroPortugues(escrevendo)
    numExtenso << auxiliar
    
    if falta >= 0 || falta <= 1
      if escrevendo > 1 
         numExtenso << 'bilhões'
	  	else
			  numExtenso << 'bilhão'
     end
    end
		if (tem_mais_numero? falta,100) || (tem_mais_numero? falta,10) || (tem_mais_numero? falta,1)
			numExtenso << 'e'
		end
  end

	escrevendo = falta/1000000           
  falta  = falta - escrevendo*1000000  
  
  if escrevendo > 0
   
	 	auxiliar = numeroPortugues(escrevendo)
    numExtenso << auxiliar
    
    if falta >= 0 || falta <= 1
      if escrevendo > 1 
         numExtenso << 'milhões'
	  	else
			  numExtenso << 'milhão'
     end
    end
		if (tem_mais_numero? falta,100) || (tem_mais_numero? falta,10) || (tem_mais_numero? falta,1)
			numExtenso << 'e'
		end
  end

	escrevendo = falta/1000           
  falta  = falta - escrevendo*1000  
  
  if escrevendo > 0
   	if escrevendo > 1
   	 auxiliar = numeroPortugues(escrevendo)
   	 numExtenso << auxiliar
  	end
    if falta >= 0
      numExtenso << 'mil'
    end
		if (tem_mais_numero? falta,100) || (tem_mais_numero? falta,10) || (tem_mais_numero? falta,1)
			numExtenso << 'e'
		end
  end

  escrevendo = falta/100           
  falta  = falta - escrevendo*100  

 if escrevendo > 0 
		if escrevendo == 1
			if falta > 0
				numExtenso << 'cento'
			else
				numExtenso << centena[escrevendo]
			end
		else
			numExtenso << centena[escrevendo]
		end
		if falta > 0
			numExtenso << 'e'
		end
end

  escrevendo = falta/10           
  falta  = falta - escrevendo*10  
  
  if escrevendo > 0
    if ((escrevendo == 1) and (falta > 0))
      
      numExtenso << especiais[falta]
    
      falta = 0
			
    else
      numExtenso << dezenas[escrevendo]
    end
    
    if falta > 0
      numExtenso << 'e'
    end
  end
  
  escrevendo = falta 
  falta  = 0          
  
  if escrevendo > 0
    numExtenso << unidades[escrevendo]
  end
  numExtenso
end

def par? numero
	return numero%2==0
end

contador = 1
puts "#{numeroPortugues(contador).join(' ')} elefante incomoda muita gente"
while contador <=99999
	contador+=1
	if par?(contador)
		puts "#{numeroPortugues(contador).join(' ')} elefantes #{'incomodam, '*(contador-1)}incomodam muito mais"
	else
		puts "#{numeroPortugues(contador).join(' ')} elefantes incomodam muita gente"
	end
end