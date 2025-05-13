;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; BASE DE CONOCIMIENTOS - SISTEMA DE COMPRAS CLIPS ;;
;; Versión: Final con template de cliente con ID ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Template para los smartphones, define los atributos o "slots".
(deftemplate smartphone
   (slot marca)  ;; Atributo para la marca del smartphone (Ej: Apple, Samsung)
   (slot modelo) ;; Atributo para el modelo del smartphone (Ej: iPhone16, Galaxy)
   (slot color)  ;; Atributo para el color del smartphone (Ej: rojo, negro)
   (slot precio)) ;; Atributo para el precio del smartphone (Ej: 27000)

;; Template para las computadoras, define los atributos o "slots".
(deftemplate compu
   (slot marca)  
   (slot modelo) 
   (slot color)  
   (slot precio)) 

;; Template para los accesorios, con tipo y precio.
(deftemplate accesorio
   (slot tipo)  ;; Atributo para el tipo de accesorio (Ej: funda, cargador)
   (slot precio)) ;; Atributo para el precio del accesorio (Ej: 500)

;; Template para los clientes, con ID único, nombre y tipo.
(deftemplate cliente
   (slot id)    ;; Atributo para el ID único del cliente (Ej: 1, 2)
   (slot nombre)  ;; Atributo para el nombre del cliente (Ej: Juan, Ana)
   (slot tipo))   ;; Atributo para el tipo de cliente (Ej: menudista, mayorista)

;; Template para la orden de compra, con marca, modelo, cantidad, banco y grupo.
(deftemplate orden
   (slot marca)  ;; Marca del producto comprado (Ej: Apple, Samsung)
   (slot modelo) ;; Modelo del producto comprado (Ej: iPhone16, Note21)
   (slot qty)    ;; Cantidad de productos comprados
   (slot banco)  ;; Banco usado para la compra (Ej: BBVA, Banamex)
   (slot grupo)) ;; Tipo de tarjeta de crédito usada (Ej: Visa, Mastercard)

;; Template para la tarjeta de crédito, con banco, grupo y fecha de expiración.
(deftemplate tarjetacred
   (slot banco)        ;; Banco emisor de la tarjeta (Ej: BBVA, Banamex)
   (slot grupo)        ;; Tipo de tarjeta (Ej: Visa, Mastercard)
   (slot fecha-expiracion)) ;; Fecha de expiración de la tarjeta de crédito

;; Template para el vale otorgado al cliente, con valor del vale.
(deftemplate vale
   (slot valor)) ;; Valor del vale (Ej: 1000)

;; Template para el stock de productos, con marca, modelo y cantidad.
(deftemplate stock
   (slot marca)  ;; Marca del producto
   (slot modelo) ;; Modelo del producto
   (slot cantidad)) ;; Cantidad disponible en stock

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. FACTS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deffacts hechos-iniciales
  ;; Hechos para los smartphones disponibles en la tienda
  (smartphone (marca apple) (modelo iPhone16) (color rojo) (precio 27000))  ;; Smartphone Apple iPhone16
  (smartphone (marca apple) (modelo iPhone15) (color negro) (precio 23000)) ;; Smartphone Apple iPhone15
  (smartphone (marca samsung) (modelo Note21) (color negro) (precio 25000)) ;; Smartphone Samsung Note21
  (smartphone (marca samsung) (modelo A54) (color azul) (precio 9000))  ;; Smartphone Samsung A54
  (smartphone (marca xiaomi) (modelo RedmiNote12) (color plata) (precio 8500))  ;; Smartphone Xiaomi RedmiNote12
  (smartphone (marca motorola) (modelo edge30) (color gris) (precio 13000)) ;; Smartphone Motorola Edge30

  ;; Hechos para las computadoras disponibles
  (compu (marca apple) (modelo MacBookAir) (color gris) (precio 27000))  ;; Computadora Apple MacBookAir
  (compu (marca apple) (modelo macbookpro) (color gris) (precio 47000))  ;; Computadora Apple MacBookPro
  (compu (marca dell) (modelo Inspiron15) (color negro) (precio 18000))  ;; Computadora Dell Inspiron15
  (compu (marca hp) (modelo Pavilion) (color blanco) (precio 16000))  ;; Computadora HP Pavilion
  (compu (marca lenovo) (modelo ThinkPadX1) (color negro) (precio 21000)) ;; Computadora Lenovo ThinkPadX1

  ;; Hechos para los accesorios disponibles
  (accesorio (tipo funda) (precio 500))  ;; Accesorio funda con precio de 500
  (accesorio (tipo mica) (precio 300))  ;; Accesorio mica con precio de 300
  (accesorio (tipo cargador) (precio 700))  ;; Accesorio cargador con precio de 700
  (accesorio (tipo audifonos) (precio 1200))  ;; Accesorio audífonos con precio de 1200
  (accesorio (tipo cable-usb) (precio 200))  ;; Accesorio cable USB con precio de 200
  (accesorio (tipo mouse) (precio 350))  ;; Accesorio mouse con precio de 350
  (accesorio (tipo mochila) (precio 1000))  ;; Accesorio mochila con precio de 1000

  ;; Hechos para las tarjetas de crédito disponibles
  (tarjetacred (banco bbva) (grupo visa) (fecha-expiracion 01-12-23))  ;; Tarjeta de crédito BBVA Visa
  (tarjetacred (banco banamex) (grupo oro) (fecha-expiracion 05-08-25))  ;; Tarjeta de crédito Banamex Oro
  (tarjetacred (banco santander) (grupo mastercard) (fecha-expiracion 10-11-24))  ;; Tarjeta de crédito Santander Mastercard
  (tarjetacred (banco liverpool) (grupo visa) (fecha-expiracion 03-07-26))  ;; Tarjeta de crédito Liverpool Visa

  ;; Hechos para el stock de productos disponibles
  (stock (marca apple) (modelo iPhone16) (cantidad 50))  ;; Stock de iPhone16 con 50 unidades
  (stock (marca apple) (modelo iPhone15) (cantidad 60))  ;; Stock de iPhone15 con 60 unidades
  (stock (marca samsung) (modelo Note21) (cantidad 40))  ;; Stock de Note21 con 40 unidades
  (stock (marca samsung) (modelo A54) (cantidad 80))  ;; Stock de A54 con 80 unidades
  (stock (marca xiaomi) (modelo RedmiNote12) (cantidad 100))  ;; Stock de RedmiNote12 con 100 unidades
  (stock (marca motorola) (modelo edge30) (cantidad 30))  ;; Stock de Edge30 con 30 unidades
  (stock (marca apple) (modelo MacBookAir) (cantidad 30))  ;; Stock de MacBookAir con 30 unidades
  (stock (marca apple) (modelo macbookpro) (cantidad 20))  ;; Stock de MacBookPro con 20 unidades
  (stock (marca dell) (modelo Inspiron15) (cantidad 25))  ;; Stock de Inspiron15 con 25 unidades
  (stock (marca hp) (modelo Pavilion) (cantidad 15))  ;; Stock de Pavilion con 15 unidades
  (stock (marca lenovo) (modelo ThinkPadX1) (cantidad 18))  ;; Stock de ThinkPadX1 con 18 unidades
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. RULES (20)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 1. Clasificar como menudista si compra menos de 10
(defrule clasificar-menudista
   (orden (qty ?q&:(< ?q 10)))  ;; La condición verifica si la cantidad de productos comprados es menor que 10
=>
   (assert (cliente (id 1) (nombre Juan) (tipo menudista)))  ;; Se clasifica al cliente con ID 1 como "menudista"
   (printout t "Cliente ID " 1 " clasificado como MENUDISTA." crlf))  ;; Imprime un mensaje en consola

;; 2. Clasificar como mayorista si compra 10 o más
(defrule clasificar-mayorista
   (orden (qty ?q&:(>= ?q 10)))  ;; La condición verifica si la cantidad de productos comprados es mayor o igual a 10
=>
   (assert (cliente (id 2) (nombre Ana) (tipo mayorista)))  ;; Se clasifica al cliente con ID 2 como "mayorista"
   (printout t "Cliente ID " 2 " clasificado como MAYORISTA." crlf))  ;; Imprime un mensaje en consola

;; 3. Descuento para mayoristas
(defrule descuento-mayorista
   (cliente (id ?id) (tipo mayorista))  ;; Condición: Cliente debe ser mayorista
   (orden (qty ?q))  ;; Condición: Cliente ha realizado una compra
=>
   (printout t "Cliente ID " ?id " recibe un Descuento: 10% aplicado por ser MAYORISTA." crlf))  ;; Imprime el descuento

;; 4. Recomendación para mayoristas
(defrule recomendacion-mayorista
   (cliente (id ?id) (tipo mayorista))  ;; Condición: Cliente debe ser mayorista
=>
   (printout t "Cliente ID " ?id " Recomendación: Cotiza volumen para beneficios adicionales." crlf))  ;; Imprime la recomendación

;; 5. Recomendación para menudistas
(defrule recomendacion-menudista
   (cliente (id ?id) (tipo menudista))  ;; Condición: Cliente debe ser menudista
=>
   (printout t "Cliente ID " ?id " Recomendación: Aprovecha promociones de accesorios y fundas." crlf))  ;; Imprime la recomendación

;; 6. Descuento extra por usar tarjeta VISA
(defrule visa-desc-accesorios
   (orden (grupo visa))  ;; Condición: Pago realizado con tarjeta VISA
=>
   (printout t "Promoción: 5% de descuento en accesorios con tarjeta VISA." crlf))  ;; Imprime el descuento

;; 7. Regalo cable USB por smartphone Samsung
(defrule samsung-regalo
   (orden (marca samsung))  ;; Condición: Orden de compra es de un smartphone Samsung
=>
   (printout t "Regalo: Cable USB gratis por comprar Samsung." crlf))  ;; Imprime que el cliente recibe el regalo

;; 8. Mochila gratis por comprar smartphone y computadora
(defrule combo-mochila
   (orden (marca ?marca1) (modelo ?modelo1))  ;; Condición: Compra de un smartphone
   (compu (marca ?marca2) (modelo ?modelo2))  ;; Condición: Compra de una computadora
=>
   (printout t "Promoción: Mochila gratis por compra combinada." crlf))  ;; Imprime que se otorga una mochila gratis

;; 9. Descuento por pago al contado (sin tarjeta)
(defrule contado-descuento
   (orden (banco nil))  ;; Condición: Pago realizado sin tarjeta
=>
   (printout t "Descuento: 3% por pago en efectivo." crlf))  ;; Imprime el descuento

;; 10. Vale por compra mayor
(defrule bono-gran-compra
   (orden (qty ?q&:(>= ?q 2)))  ;; Condición: Compra de 2 o más productos
=>
   (assert (vale (valor 1000)))  ;; Crea un vale de 1000
   (printout t "Bono: $1000 en vales por compra grande." crlf))  ;; Imprime el bono

;; 11. Seguro gratis por comprar MacBook Air
(defrule seguro-macbook
   (orden (modelo MacBookAir))  ;; Condición: La orden es de un MacBook Air
=>
   (printout t "Incluye: Seguro gratis 1 año con MacBook Air." crlf))  ;; Imprime que se incluye un seguro gratis

;; 12. Descuento por comprar productos Apple
(defrule apple-descuento
   (orden (marca apple))  ;; Condición: Compra de productos Apple
=>
   (printout t "Descuento: 5% aplicado en productos Apple." crlf))  ;; Imprime el descuento

;; 13. Envío exprés con BBVA Visa
(defrule bbva-envio
   (orden (banco bbva) (grupo visa))  ;; Condición: Pago con tarjeta BBVA Visa
=>
   (printout t "Beneficio: Envío exprés gratis con BBVA VISA." crlf))  ;; Imprime el beneficio

;; 14. Envío gratis de accesorio con smartphone
(defrule accesorio-envio-gratis
   (orden (marca ?m))  ;; Condición: Compra de un smartphone
   (accesorio (tipo ?a))  ;; Condición: Tiene un accesorio
=>
   (printout t "Promoción: Envío gratis de accesorio junto a smartphone." crlf))  ;; Imprime la promoción

;; 15. MSI en MacBook Pro con BBVA
(defrule macbookpro-msi
   (orden (modelo macbookpro) (banco bbva))  ;; Condición: Pago con BBVA y compra de MacBookPro
=>
   (printout t "Oferta: 6 MSI en MacBook Pro con BBVA." crlf))  ;; Imprime la oferta de MSI

;; 16. Oferta especial iPhone16 con Banamex Oro
(defrule iphone16-banamex
   (orden (marca apple) (modelo iPhone16) (banco banamex) (grupo oro))  ;; Condición: Compra de iPhone16 con Banamex Oro
=>
   (printout t "Oferta: 24 meses sin intereses con Banamex en iPhone16." crlf))  ;; Imprime la oferta

;; 17. Oferta Note21 con Liverpool VISA
(defrule note21-liverpool
   (orden (marca samsung) (modelo Note21) (banco liverpool) (grupo visa))  ;; Condición: Compra de Note21 con Liverpool VISA
=>
   (printout t "Oferta: 12 MSI con Liverpool VISA en Note21." crlf))  ;; Imprime la oferta

;; 18. Accesorios con 15% de descuento por smartphone
(defrule accesorios-descuento
   (orden (marca ?marca))  ;; Condición: Compra de un smartphone
=>
   (printout t "Promoción: 15% de descuento en funda y mica por comprar smartphone." crlf))  ;; Imprime el descuento

;; 19. Actualizar stock
(defrule actualizar-stock
   ?o <- (orden (marca ?marca) (modelo ?modelo) (qty ?q))  ;; Condición: Orden con cantidad de productos
   ?s <- (stock (marca ?marca) (modelo ?modelo) (cantidad ?exist))  ;; Verifica el stock
   (test (>= ?exist ?q))  ;; Si hay suficiente stock
=>
   (retract ?s)  ;; Elimina el stock anterior
   (bind ?nuevo (- ?exist ?q))  ;; Actualiza el stock con la nueva cantidad
   (assert (stock (marca ?marca) (modelo ?modelo) (cantidad ?nuevo)))  ;; Agrega el nuevo stock
   (printout t "Stock actualizado de " ?marca " " ?modelo ": " ?nuevo " unidades." crlf))  ;; Imprime el nuevo stock

;; 20. Vale por MacBook Air + iPhone15 al contado → $100 x cada $1000
(defrule macbookair-iphone15-vales
   (orden (marca apple) (modelo iPhone15) (qty ?q) (banco nil))  ;; Condición: Compra de iPhone15 sin tarjeta
   (compu (marca apple) (modelo MacBookAir))  ;; Condición: Compra de MacBookAir
=>
   (bind ?total (* ?q (+ 23000 27000)))  ;; Calcula el total de la compra
   (bind ?vales (* (div ?total 1000) 100))  ;; Calcula los vales
   (assert (vale (valor ?vales)))  ;; Crea un vale con el valor calculado
   (printout t "Promoción: $" ?vales " en vales por compra conjunta." crlf))  ;; Imprime la promoción
